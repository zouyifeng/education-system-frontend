<template>
    <el-col :span="12" :offset="2">
        <h3>编辑班级</h3><hr>
        <el-form label-width="100px">
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
                <div id="editor"></div>
            </el-form-item>
            <el-dialog v-model="img.dialogVisible" size="tiny">
                <img width="100%" :src="img.dialogImageUrl" alt="">
            </el-dialog>
            
            <el-button type="primary" v-on:click="submit">提交</el-button>
        </el-form>
    </el-col>
</template> 
<script>

    import $ from 'jquery'
    import 'wangeditor/dist/css/wangEditor.min.css'
    import wangeditor from 'wangeditor'

    export default {
        data() {
            return {
                classes: {
                    'subject': '',
                    'sumary': '',
                    'context': '',
                    'description': ''
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
                this.$store.dispatch('fetchClassesDetail', {data: data}).then((resp) => {
                    this.classes = resp.data.data;
                });
            }

            $(function(){
                var editor = new wangeditor('editor');
                editor.config.uploadImgUrl = '/api/admin/member_pic_upload.action';

                editor.config.uploadImgFileName = 'pic';

                editor.config.uploadImgFns.onload = function(result, xhr){
                    result = JSON.parse(result);
                     editor.command(null, 'insertHtml', '<img src="/api/resources/picture/' + result.data.picUrl +'" style="max-width:100%;"/>');
                }

                editor.create();
            })
        },
        methods: {
            submit () {
                this.classes.description = $(editor).html();
                var actionType = this.classes.id ? 'editClasses' : 'addClasses'; 
                this.$store.dispatch(actionType, {data: this.classes}).then((resp) => {
                    // console.log(resp)
                    this.$router.push({path : './classes'});
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