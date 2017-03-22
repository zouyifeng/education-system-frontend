<template>
    <el-col :span="12" :offset="2">
        <h3>编辑学生</h3><hr>
        <el-form :label-position="labelPosition" label-width="80px">
            <el-form-item label="姓名">
                <el-input v-model="teacher.name"></el-input>
            </el-form-item>
            <el-form-item label="邮箱">
                <el-input v-model="teacher.email"></el-input>
            </el-form-item>
            <el-form-item label="电话"> 
                <el-input v-model="teacher.telephone"></el-input>
            </el-form-item>
            <el-form-item label="研究方向"> 
                <el-input v-model="teacher.direction"></el-input>
            </el-form-item> 
            <el-form-item label="详细介绍"> 
                <el-input type="textarea" v-model="teacher.introduction"></el-input>
            </el-form-item> 
                        <el-form-item label="照片上传">
                <el-upload name="pic" v-if="imageUrl === ''" action="/api/admin/member_pic_upload.action" list-type="picture-card" :on-preview="handlePictureCardPreview" :on-remove="handleRemove" :on-success="handleSuccessUpload">
                    <i class="el-icon-plus"></i>
                </el-upload>
                <div class="image-container">
                    <el-card :body-style="{ margin: '0 auto'}" v-if="imageUrl !== ''">
                        <img :src="imageUrl" class="image">
                        <div class="bottom clearfix">
                            <el-button class="button" v-on:click="dialogVisible=true">删除</el-button>
                        </div>
                    </el-card>
                </div>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" v-on:click="submit">提交</el-button>
            </el-form-item>
        </el-form>
        <el-dialog title="删除头像" v-model="dialogVisible" size="tiny">
            <span>确定删除{{teacher.name}}的头像?</span>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="dialogVisible = false;imageUrl=''">确 定</el-button>
            </span>
        </el-dialog>
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
    export default {
        data() {
            return {
                teacher: {
                    'name': '',
                    'telephone': '',
                    'email': '',
                    'direction': '',
                    'introduction':'',
                    'face': '',
                    'type': '0'
                },
                dialogVisible: false,
                dialogImageUrl: ''
            }
        },
        created () {
            console.info(this.$route.params.id)
            if(this.$route.params.id !== undefined){
                var data = { id : this.$route.params.id };
                this.$store.dispatch('fetchTeacherDetail', {data: data}).then((resp)=>{
                    // this.teacher = resp.data.data;
                    this.imageUrl = 'api/picture/' + this.student.face;
                });
            }
        },
        methods: {
            submit () {
                var actionType = this.teacher.id? 'editTeacher' : 'addTeacher',                 
                    actionTypeStr = this.teacher.id ? '修改' : '新增'; 
                this.$store.dispatch(actionType, {data: this.teacher}).then((resp) => {
                    this.$router.push({path : '../admin/teacher'});
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
            handleRemove(file, fileList) {
                console.log(file, fileList);
            },
            handlePictureCardPreview(file) {
                console.log(file)
                this.img.dialogImageUrl = file.url;
                this.img.dialogVisible = false;
            },
            handleSuccessUpload(resp, file, fileList){
                // var picUrl = resp.data.picUrl;
                this.teacher.face = resp.data.picUrl;
            }
        }
    }
</script>