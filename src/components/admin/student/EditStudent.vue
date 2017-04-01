<template>
    <el-col :span="23">
        <el-form label-width="80px">
            <el-form-item label="姓名">
                <el-input v-model="student.name"></el-input>
            </el-form-item>
            <el-form-item label="邮箱">
                <el-input v-model="student.email"></el-input>
            </el-form-item>
            <el-form-item label="电话"> 
                <el-input v-model="student.telephone"></el-input>
            </el-form-item>
            <el-form-item label="研究方向"> 
                <el-input v-model="student.direction"></el-input>
            </el-form-item> 
            <el-form-item label="选择报班">
                <el-select v-model="student.classesId" placeholder="请选择班级">
                    <el-option v-for="item in classList.list" v-bind:label="item.subject" v-bind:value="item.id">
                        <span>{{item.subject}}</span>
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="详细介绍"> 
                <el-input v-model="student.introduction"></el-input>
            </el-form-item> 
            <el-form-item label="照片上传">
                <el-upload name="pic" v-if="imageUrl === ''" v-bind:action="urlPrefix +  '/admin/member_pic_upload.action'" list-type="picture-card" :on-preview="handlePictureCardPreview" :on-remove="handleRemove" :on-success="handleSuccessUpload">
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
                                v-model="confirmDelete">
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
                    'name': '',
                    'telephone': '',
                    'email': '',
                    'direction': '',
                    'introduction':'',
                    'face': '',
                    'type': '1',
                    'classesId': ''
                },
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
        watch: {
            studentId: function(newValue, oldValue){
                if(newValue !== ''){
                    var data = { id : newValue };
                    this.$store.dispatch('fetchStudentDetail', {data: data}).then((resp)=>{
                        this.student = resp.data.data;
                        this.imageUrl = 'api/' + this.student.face;
                    });
                }
            }
        },
        methods: {
            submit () {
                var actionType = this.student.id ? 'editStudent' : 'addStudent',
                    actionTypeStr = this.student.id ? '修改' : '新增'; 
                this.$store.dispatch(actionType, {data: this.student}).then((resp) => {
                    this.$router.push({path : '../admin/student'});
                    this.$notify.success({
                        title: actionTypeStr + '成功',
                        message: resp.data.data.message,
                        offset: 100
                    });
                }, () => {
                    this.$notify.error({
                        title: actionTypeStr + '失败',
                        offset: 100
                    });
                });
            },
            closeDialog(){
                this.$store.dispatch('changeEditDialogVisible');
            },
            handleRemove(file, fileList) {
                console.log(file, fileList);
            },
            handlePictureCardPreview(file) {
                console.log(file)
                this.imageUrl = file.url;
                // this.img.dialogVisible = false;
            },
            handleSuccessUpload(resp, file, fileList){
                // var picUrl = resp.data.picUrl;
                this.student.face = resp.data.picUrl;
            }
            
        }
    }
</script>
