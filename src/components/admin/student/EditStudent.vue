<template>
    <div class="panel panel-default">
        <div class="panel-heading">新增学生</div>
        <div class="panel-body">
            <form>
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input id="name" type="text" class="form-control" placeholder="姓名" v-model="student.name">
                </div>
                <div class="form-group">
                    <label for="email">邮箱</label>
                    <input id="email" type="text" class="form-control" placeholder="邮箱" v-model="student.email">
                </div>
                <div class="form-group">
                    <label for="phone">电话</label>
                    <input id="phone" type="text" class="form-control" placeholder="电话" v-model="student.telephone">
                </div>
                <div class="form-group">
                    <label for="direction">研究方向</label>
                    <textarea id="direction" type="text" class="form-control" placeholder="研究方向" v-model="student.direction"></textarea>
                </div>
                <div class="form-group">
                    <label for="detail">详细介绍</label>
                    <textarea id="detail" type="text" class="form-control" placeholder="详细介绍" v-model="student.introduction"></textarea>
                </div>
                <div class="form-group">
                    <label for="photo">照片</label>
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
                student: {
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
                this.$store.dispatch('fetchStudentDetail', {data: data}).then((resp)=>{
                    console.log(resp.data.data)
                    this.student = resp.data.data;
                });
            }
        },
        methods: {
            submit () {
                var actionType = this.student.id ? 'editStudent' : 'addStudent'; 
                console.log('editteacher')
                this.$store.dispatch(actionType, {data: this.student}).then((resp) => {
                    // console.log(resp)
                    this.$router.push({path : '../student'});
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