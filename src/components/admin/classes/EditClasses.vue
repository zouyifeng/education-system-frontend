<template>
    <el-col :span="12" :offset="4">
        <el-form :label-position="labelPosition" label-width="80px">
            <el-form-item label="班级科目">
                <el-input v-model="classes.subject"></el-input>
            </el-form-item>
            <el-form-item label="班级简介">
                <el-input v-model="classes.sumary"></el-input>
            </el-form-item>
            <el-form-item label="详细介绍"> 
                <el-input v-model="classes.context"></el-input>
            </el-form-item> 
            <el-form-item v-if="!!this.$route.params.id" label="班级活动记录">
                <el-input type="textarea" v-model="activity.description"></el-input>
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
                classes: {
                    'subject': '',
                    'sumary': '',
                    'context': ''
                },
                activity: {
                    description: ''
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
                this.$store.dispatch('fetchClassesDetail', {data: data}).then((resp)=>{
                    this.classes = resp.data.data;
                    console.log(this.classes.id)
                });
            }
        },
        methods: {
            submit () {
                console.log(this.classes.id)
                var actionType = this.classes.id ? 'editClasses' : 'addClasses'; 
                this.$store.dispatch(actionType, {data: this.classes}).then((resp) => {
                    // console.log(resp)
                    this.$router.push({path : './classes'});
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
                this.student.face = resp.data.picUrl;
            }
        }
    }
</script>