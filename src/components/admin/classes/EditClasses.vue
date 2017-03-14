<template>
    <div class="panel panel-default">
        <div class="panel-heading">新增班级</div>
        <div class="panel-body">
            <form>
                <div class="form-group">
                    <label for="subject">班级科目</label>
                    <input id="subject" type="text" class="form-control" placeholder="科目" v-model="classes.subject">
                </div>
                <div class="form-group">
                    <label for="summary">班级简介</label>
                    <input id="summary" type="text" class="form-control" placeholder="班级简介" v-model="classes.sumary">  
                </div>
                <div class="form-group">
                    <label for="context">详细介绍</label>
                    <input id="context" type="text" class="form-control" placeholder="详细介绍" v-model="classes.context">
                </div>
                <div class="form-group" v-if="!!this.$route.params.id">
                    <label for="photo">班级活动记录</label>
                    <label for="description">活动描述</label>
                    <input id="description" type="text" class="form-control" placeholder="活动描述" v-model="activity.description">
                    <el-upload name="pic" action="/api/admin/member_pic_upload.action" list-type="picture-card" :on-preview="handlePictureCardPreview" :on-remove="handleRemove" :on-success="handleSuccessUpload">
                        <i class="el-icon-plus"></i>
                    </el-upload>
                    <el-dialog v-model="img.dialogVisible" size="tiny">
                        <img width="100%" :src="img.dialogImageUrl" alt="">
                    </el-dialog>
                </div>
                <button type="submit" class="btn btn-default" v-on:click="submit">提交</button>
            </form>
        </div>
    </div>
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