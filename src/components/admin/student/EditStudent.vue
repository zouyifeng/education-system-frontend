<template>
    <el-col :span="23">
        <el-form :inline="true" label-width="70px">
            <el-form-item label="姓名">
                <el-input v-model="student.name"></el-input>
            </el-form-item>
            <el-form-item label="邮箱">
                <el-input v-model="student.email"></el-input>
            </el-form-item>
        </el-form>
        <el-form label-width="70px" :inline="true">
            <el-form-item label="电话"> 
                <el-input v-model="student.telephone"></el-input>
            </el-form-item>
            <el-form-item label="就读学校"> 
                <el-input v-model="student.school"></el-input>
            </el-form-item>
            <el-form-item label="父母名字"> 
                <el-input v-model="student.parentName"></el-input>
            </el-form-item> 
        </el-form>
        <el-form label-width="70px">
            <el-form-item label="选择报班">
                 <el-table
                    :data="classList.list">
                    <el-table-column
                        prop="subject"
                        label="班级">
                    </el-table-column>
                    <el-table-column
                        prop="id"
                        label="简介">
                    </el-table-column>
                    <el-table-column 
                        label="操作"
                        width="180px">
                        <template scope="scope">
                            <el-button size="small" type="danger" @click="assignClasses(scope.row)">报班</el-button>
                        </template>
                    </el-table-column>
                </el-table>
                <div class="pull-right block">
                    <el-pagination
                        small
                        layout="total,prev, pager, next"
                        :current-page="classList.pageInfo.pageNum"
                        :page-size="6"
                        :total="classList.pageInfo.total"
                        @current-change="nextPage">
                    </el-pagination>
                </div>
            </el-form-item>
            <el-form-item label="已报班级">
                <el-tag
                    class="mr-15"
                    v-for="item in student.classes"
                    :closable="true"
                    type="primary"
                    @close="cancelAssginedClasses(item)"
                    >
                    {{item.subject}}
                </el-tag>
                <span v-if="student.classes.length == 0">暂无</span>
            </el-form-item>
            <el-form-item label="详细介绍"> 
                <el-input v-model="student.introduction"></el-input>
            </el-form-item> 
            <el-form-item label="照片上传">
                <el-upload name="pic" v-if="imageUrl === ''" v-bind:action="urlPrefix +  '/admin/member_pic_upload.action'" list-type="picture-card" :on-preview="handlePictureCardPreview" :on-success="handleSuccessUpload">
                    <i class="el-icon-plus"></i>
                </el-upload>
                <div class="image-container">
                    <el-card :body-style="{ margin: '0 auto'}" v-if="imageUrl !== ''">
                        <img :src="imageUrl" class="image">
                        <div class="bottom clearfix">
                            <el-popover
                                ref="popover1"
                                placement="top"
                                width="160"
                                v-model="pageConfig.confirmDelete">
                                <p>确定删除{{student.name}}的头像吗？</p>
                                <div style="text-align: right; margin: 0">
                                    <el-button size="mini" type="text" @click="pageConfig.confirmDelete = false">取消</el-button>
                                    <el-button type="primary" size="mini" @click="pageConfig.confirmDelete = false; imageUrl = ''">确定</el-button>
                                </div>
                            </el-popover>
                            <el-button class="button" v-popover:popover1>删除</el-button>
                        </div>
                    </el-card>
                </div>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" v-on:click="closeDialog();submit()">提交</el-button>
                <el-button @click="closeDialog()">取 消</el-button>                
            </el-form-item>          
        </el-form>
    </el-col>
</template>
<style>
    .image {
        width: 100%;
    }
    
    .bottom {
        margin-top: 13px;
        line-height: 12px;
    }

    .button {
        padding: 0;
        float: right;
    }

    .image {
        width: 100%;
        display: block;
    }

    .clearfix:before,
    .clearfix:after {
        display: table;
        content: "";
    }
    
    .clearfix:after {
        clear: both
    }

    .image-container {
        width: 60%;
    }
</style>
<script>

    import EditStudent from './EditStudent'
    import { mapGetters } from 'vuex'
    import * as Util from '../../../store/util'

    export default {
        props: ['studentId'],
        data() {
            return {
                student: {
                    name: '',
                    telephone: '',
                    email: '',
                    school: '',
                    introduction:'',
                    face: '',
                    parentName: '',
                    classes: []
                },
                account: {},
                pageConfig:{
                    confirmDelete: false
                },
                imageUrl: '',                
                urlPrefix: Util.urlPrefix
            }
        },
        computed: mapGetters({
            classList: 'getAdminClassesList'
        }),
        created() {
            this.$store.dispatch('fetchAdminClassesList', {data: {}, pageInfo: {pageNum: 1}});

            const that = this;
            this.$store.dispatch('fetchStudentDetail', {data: { id: this.studentId}}).then((resp)=>{
                that.student = resp.body.data;
                that.imageUrl = this.student.face;
            });
        },
        watch: {
            studentId: function(newValue, oldValue){
                if(newValue !== ''){
                    var data = { id : newValue },
                        that = this;
                    this.$store.dispatch('fetchStudentDetail', {data: data}).then((resp)=>{
                        that.student = resp.body.data;
                        that.imageUrl = this.student.face;
                    });
                }
            }
        },
        methods: {
            submit () {
                var actionType = this.student.id ? 'editStudent' : 'addStudent',
                    actionTypeStr = this.student.id ? '修改' : '新增',
                    that = this; 
                this.$store.dispatch(actionType, {data: this.student}).then((resp) => {
                    this.$router.push({path : '../admin/student'});
                    if(resp.data.data.account) {
                        that.account = resp.data.data.account;
                    }
                    this.$notify.success({
                        title: actionTypeStr + '成功',
                        message: !that.student.id ? '系统分配账号：' + that.account.username + '&nbsp; 密码： ' +  that.account.password : resp.data.data.message,  
                        offset: 100,
                        duration: 0
                    });
                    this.$store.dispatch('fetchAdminStudentList', {pageInfo: {pageNum: 1}})
                }, () => {
                    this.$notify.error({
                        title: actionTypeStr + '失败',
                        offset: 100
                    });
                });
                this.closeDialog();
            },
            nextPage(page) {
                this.classList.pageInfo.pageNum = page;
                this.$store.dispatch('fetchAdminClassesList',{ data: {}, pageInfo: this.classList.pageInfo })
            },
            assignClasses(item) {
                this.student.classes.push(item);
            },
            cancelAssginedClasses(item) {
                for(var i=0; i<this.student.classes.length; i++){
                    if(item.id == this.student.classes[i].id){
                        this.student.classes.splice(i, 1);
                    }
                }
            },
            closeDialog(){
                this.$store.dispatch('closeEditDialogVisible');
            },
            handlePictureCardPreview(file) {
                this.imageUrl = file.url;
            },
            handleSuccessUpload(resp, file, fileList){
                this.student.face = resp.data.picUrl;
            }
            
        }
    }
</script>
