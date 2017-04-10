<template>
<el-col :span="20" :offset="1" class="mt-15">
    <el-tabs v-model="pageConfig.activeName">
        <el-tab-pane label="教师信息" name="first">
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
            <el-form label-width="80px">
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
                    <el-button type="primary" v-on:click="submit()">修改个人信息</el-button>           
                </el-form-item>
            </el-form>
        </el-tab-pane>
        <el-tab-pane label="课程表" name="second">
            <el-form>
            <el-form-item label="课程表选择">
                <el-select v-model="pageConfig.selectedScheduleId" placeholder="请选择班级">
                    <el-option
                        v-for="item in student.classes"
                        :label="item.subject"
                        :value="item.id">
                    </el-option>
                </el-select>
                <a v-bind:href="'#/management/admin/studentIndex/schedule/'+pageConfig.selectedScheduleId"><el-button type="primary" size="normal" class="ml-15">確定</el-button></a>                   
            </el-form-item>
            <router-view></router-view>
            </el-form>
        </el-tab-pane>
    </el-tabs>
</el-col>
</template>
<style> 
    .image-container {
        width: 240px;
    }
</style>
<script>
    import { mapGetters } from 'vuex'
    import * as Util from '../../../store/util'

    export default {
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
                pageConfig:{
                    confirmDelete: false,
                    activeName: 'first'
                },
                imageUrl: '',                
                urlPrefix: Util.urlPrefix
            }
        },        
        computed : mapGetters({
            currentAccount :  'getCurrentAccount'
        }),
        created() {
           this.fetchStudentDetail();
        },
        methods: {
            submit () {
                const that = this;
                this.$store.dispatch('editStudent', {data: this.student}).then((resp) => {
                    this.$notify.success({
                        title: '修改成功',
                        message: resp.data.data.message,
                        offset: 100
                    });
                    that.fetchStudentDetail();
                });
            },
            handlePictureCardPreview(file) {
                this.img.dialogImageUrl = file.url;
                this.img.dialogVisible = false;
            },
            handleSuccessUpload(resp, file, fileList){
                this.student.face = resp.data.picUrl;
            },
            fetchStudentDetail() {
                 const that = this;
                this.$store.dispatch('fetchStudentDetail', {data: {id: this.currentAccount.userId}}).then((resp)=>{
                    that.student = resp.data.data;
                    that.imageUrl = this.student.face;
                });
            }
        }
    }
</script>