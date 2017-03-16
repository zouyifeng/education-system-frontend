<template>
    <el-col :span="12" :offset="4">
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
            <el-upload name="pic" action="/api/admin/member_pic_upload.action" list-type="picture-card" :on-preview="handlePictureCardPreview" :on-remove="handleRemove" :on-success="handleSuccessUpload">
                <i class="el-icon-plus"></i>
            </el-upload>
            <el-dialog v-model="img.dialogVisible" size="tiny">
                <img width="100%" :src="img.dialogImageUrl" alt="">
            </el-dialog>
            <el-button type="primary" v-on:click="submit">提交</el-button>
        </el-form>
    </el-col>
</template>
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
                    'type': '1'
                },
                img: {
                    dialogVisible: false,
                    dialogImageUrl: ''
                }
            }
        },
        created () {
            if(this.$route.params.id !== undefined){
                var data = { id : this.$route.params.id };
                this.$store.dispatch('fetchTeacherDetail', {data: data}).then((resp)=>{
                    console.log(resp.data.data)
                    this.teacher = resp.data.data;
                });
            }
        },
        methods: {
            submit () {
                var actionType = this.teacher.id ? 'editTeacher' : 'addTeacher'; 
                console.log('editteacher')
                this.$store.dispatch(actionType, {data: this.teacher}).then((resp) => {
                    // console.log(resp)
                    this.$router.push({path : '../teacher'});
                }, () => {
                    console.log('error')
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