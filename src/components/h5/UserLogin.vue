<template>
    <div class="login-box">
        <el-form :model="loginAccount" label-width="54px" class="block-center">
            <el-form-item label="用户名" prop="username">
                <el-input type="text" v-model="loginAccount.username" ></el-input>
            </el-form-item>
            <el-form-item label="密码" prop="password">
                <el-input type="password" v-model="loginAccount.password"></el-input>
            </el-form-item>
            <el-form-item label="类型">
                <el-radio class="radio" v-model="loginAccount.type" label="1">学生</el-radio>
                <el-radio class="radio" v-model="loginAccount.type" label="2">教师</el-radio>
            </el-form-item>
            <el-form-item>
                <el-button type="success" @click="login">登录</el-button>
                <el-button @click="loginAccount.username='';loginAccount.password=''">重置</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<style lang="scss">
    .login-box {
        width: 90%;
        margin: 0 auto;
        padding-top: 150px;
    }
</style>
<script>

    import * as Util from '../../store/util'

    export default {
        data() {
            return { 
                loginAccount: {
                    username: '',
                    password: '',
                    type: '',
                    openId: Util.getQueryObj('redirect')
                }
            }
        },
        methods: {
            login() {
                console.log('login')
                if(this.loginAccount.username == '') {
                    this.$message.error('请输入用户名！');
                } else  if(this.loginAccount.password == ''){
                    this.$message.error('请输入密码  ！');
                } else  if(this.loginAccount.type == ''){
                    this.$message.error('请选择类型！');
                } else {
                    // this.$store.dispatch('fetchAccount', {'data': this.loginAccount});
                    const url = '/wechat/userLogin.action',
                        that = this;
                    Util.post({ url }, {data: this.loginAccount}).then((resp)=>{
                        console.log('1')
                        if(!!resp.body.data.msg) {
                            console.log('a')
                            that.$message.error(resp.body.data.msg);
                        }else if(that.loginAccount.type == 1){
                            console.log('b')
                            location.hash = '#/h5StudentIndex/' + resp.body.data.id
                        } else if(that.loginAccount.type == 2) {
                            console.log('c')
                             location.hash = '#/h5TeacherIndex/' + resp.body.data.id
                        }
                    })
                }
            }
        }
    }
</script>