<template>
    <el-col :span="23">
        <el-form :moel="teacher" ref="teacher" :inline="true" label-width="80px">
            <el-form-item label="姓名">
                <el-input v-model="teacher.name"></el-input>
            </el-form-item>
            <el-form-item label="邮箱">
                <el-input v-model="teacher.email"></el-input>
            </el-form-item>
        </el-form>
        <el-form :inline="true" label-width="80px">
            <el-form-item label="电话"> 
                <el-input v-model="teacher.telephone"></el-input>
            </el-form-item>
            <el-form-item label="研究方向"> 
                <el-input v-model="teacher.majorName"></el-input>
            </el-form-item> 
        </el-form>
        <el-form label-width="80px">
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
                        @current-change="this.classList.pageInfo.pageNum=arguments[0];nextPage()">
                    </el-pagination>
                </div>
            </el-form-item>
            <el-form-item label="已报班级">
                <el-tag
                    class="mr-15"
                    v-for="item in teacher.classes"
                    :closable="true"
                    type="primary"
                    @close="cancelAssginedClasses(item)">
                    {{item.subject}}
                </el-tag>
                <span v-if="teacher.classes.length == 0">暂无</span>
            </el-form-item>
            <el-form-item label="详细介绍"> 
                <el-input type="textarea" v-model="teacher.introduction"></el-input>
            </el-form-item> 
            <el-form-item label="照片上传">
                <el-upload name="pic" v-if="imageUrl === ''" v-bind:action="urlPrefix + '/admin/member_pic_upload.action'" list-type="picture-card" :on-preview="handlePictureCardPreview" :on-success="handleSuccessUpload">
                    <i class="el-icon-plus"></i>
                </el-upload>
                <div class="image-container">
                    <el-card :body-style="{ margin: '0 auto'}" v-if="imageUrl !== ''">
                        <img :src="imageUrl" class="image">
                        <div class="bottom clearfix">
                            <el-popover
                                ref="popover2"
                                placement="top"
                                width="160"
                                v-model="pageConfig.confirmDelete">
                                <p>确定删除{{teacher.name}}的头像吗？</p>
                                <div style="text-align: right; margin: 0">
                                    <el-button size="mini" type="text" @click="pageConfig.confirmDelete = false">取消</el-button>
                                    <el-button type="primary" size="mini" @click="pageConfig.confirmDelete = false; imageUrl = ''">确定</el-button>
                                </div>
                            </el-popover>
                            <el-button class="button" v-popover:popover2>删除</el-button>
                        </div>
                    </el-card>
                </div>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" v-on:click="closeDialog();submit()">提交</el-button>
                <el-button @click="closeDialog">取 消</el-button>                
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

    import EditTeacher from './EditTeacher'
    import { mapGetters } from 'vuex'
    import * as Util from '../../../store/util'

    export default {
        props: ['teacherId'],
        data() {
            return {
                teacher: {
                    name: '',
                    telephone: '',
                    email: '',
                    direction: '',
                    introduction:'',
                    face: '',
                    classesId: '',
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
            this.$store.dispatch('fetchAdminClassesList', {pageInfo: {pageNum: 1}})
            
            if(this.teacherId) {
                const that = this;
                this.$store.dispatch('fetchAdminTeacherDetail', {data: {id: this.teacherId}}).then((resp)=>{
                    that.teacher = resp.data.data;
                    that.imageUrl = this.teacher.face;
                });
            } 
        },
        watch: {
            teacherId: function(newValue,oldValue){
            console.log(newValue == '')
                if(newValue !== ''){
                    var data = { id : newValue },
                        that = this;
                    this.$store.dispatch('fetchAdminTeacherDetail', {data: data}).then((resp)=>{
                        that.teacher = resp.data.data;
                        that.imageUrl = this.teacher.face;
                    });
                } else {
                    this.teacher = {
                        name: '',
                        telephone: '',
                        email: '',
                        direction: '',
                        introduction:'',
                        face: '',
                        classesId: '',
                        classes: []
                    };
                    this.imageUrl = '';
                } 
            }
        },
        methods: {
            submit () {
                var actionType = this.teacher.id? 'editTeacher' : 'addTeacher',                 
                    actionTypeStr = this.teacher.id ? '修改' : '新增',
                    that = this; 
                this.$store.dispatch(actionType, {data: this.teacher}).then((resp) => {
                    this.$router.push({path : '../admin/teacher'});
                    if(resp.data.data.account) {
                        that.account = resp.data.data.account;
                    }
                    this.$notify.success({
                        title: actionTypeStr + '成功',
                        message: !that.teacher.id ? '系统分配账号：' + that.account.username + '&nbsp; 密码： ' +  that.account.password : resp.data.data.message,
                        offset: 100,
                        duration: 0
                    });
                    this.$refs['teacher'].resetFields();
                    this.$store.dispatch('fetchAdminTeacherList', {pageInfo: {pageNum: 1}})
                }, () => {
                    this.$notify.error({
                        title: actionTypeStr + '失败',
                        offset: 100
                    });
                });
                this.closeDialog();
            },
            nextPage() {
                
                this.$store.dispatch('fetchAdminClassesList',{ data: {}, pageInfo: this.classList.pageInfo })
            },
            assignClasses(item) {
                this.teacher.classes.push(item);
            },
            cancelAssginedClasses(item) {
                for(var i=0; i<this.teacher.classes.length; i++){
                    if(item.id == this.teacher.classes[i].id){
                        this.teacher.classes.splice(i, 1);
                    }
                }
            },
            closeDialog() {
                this.$store.dispatch('closeEditDialogVisible');
            },
            handlePictureCardPreview(file) {
                this.img.dialogImageUrl = file.url;
                this.img.dialogVisible = false;
            },
            handleSuccessUpload(resp, file, fileList){
                this.teacher.face = resp.data.picUrl;
            }
        }
    }
</script>