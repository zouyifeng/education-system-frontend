<template>
    <div class="login"> 
        <el-form :model="loginAccount" :rules="rule" ref="loginAccount" label-width="100px" class="demo-ruleForm">
            <el-form-item label="用户名" prop="username">
                <el-input type="text" v-model="loginAccount.username" auto-complete="off"></el-input>
            </el-form-item>
            <el-form-item label="密码" prop="password">
                <el-input type="password" v-model="loginAccount.password" auto-complete="off"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="login">登录</el-button>
                <el-button @click="resetForm('loginAccount')">重置</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<style>
    .login{
        border-left: 1px solid #ddd;
    }
</style>
<script>
    import { mapGetters } from 'vuex'

    export default {
        data() {
            var validatePass = (rule, value, callback) => {
                if(value === ''){
                    callback(new Error('please enter password!'));
                } else {
                    if(this.loginAccount.password !== '') {
                        this.$refs.loginAccount.validateField('password');
                    }
                    callback();
                }
            };
            var validateUsername = (rule, value, callback) => {
                if(value === ''){
                    callback(new Error('please enter username!'));
                } else {
                    if(this.loginAccount.username !== ''){
                        this.$ref.loginAccount.validateField('username');
                    }
                }
            }
            return { 
                loginAccount: {
                    username: '',
                    password: ''
                },
                rule: {
                    password: [
                        {validator: validatePass, trigger: 'blur'}
                    ],
                    username: [
                        {validator: validateUsername, trigger: 'blur'}
                    ]
                }
            }
        },
        computed : mapGetters({
            currentAccount :  'getCurrentAccount'
        }),
        methods: {
            login() {
                this.$store.dispatch('fetchAccount', {'data': this.loginAccount});
            },
            resetForm(formName){
                this.$refs[formName].resetFields();
            }
        },
        watch: {
            currentAccount: {   
                handler: function(newValue, oldValue){
                    if(newValue.id != ''){
                        this.$router.push('../admin')
                    }
                },
                deep: true
            },
        }
    }
</script>