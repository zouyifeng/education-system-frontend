<template>
    <div class="box"> 
        <div class="box-title warning-bg"><i class="el-icon-edit mr-15"></i>登陆</div>
        <div class="box-content">
            <el-form :model="loginAccount" :rules="rule" ref="loginAccount" label-width="54px" class="block-center">
                <el-form-item label="用户名" prop="username">
                    <el-input type="text" v-model="loginAccount.username" auto-complete="off"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                    <el-input type="password" v-model="loginAccount.password" auto-complete="off"></el-input>
                </el-form-item>
                <el-form-item label="类型">
                    <el-radio class="radio" v-model="loginAccount.type" label="1">学生</el-radio>
                    <el-radio class="radio" v-model="loginAccount.type" label="2">教师</el-radio>
                    <el-radio class="radio" v-model="loginAccount.type" label="3">管理员</el-radio>
                </el-form-item>
                <el-form-item>
                    <el-button type="success" @click="login">登录</el-button>
                    <el-button @click="resetForm('loginAccount')">重置</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>
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
                    password: '',
                    type: ''
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
                        this.$store.dispatch('changeLoginStatis');
                    }
                },
                deep: true
            },
        }
    }
</script>