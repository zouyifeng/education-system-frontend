<template>
    <div class="panel panel-default">
        <div class="panel-heading">
        <h3 class="panel-title">管理员入口</h3>
        </div>
        <div class="panel-body">
        <div class="input-group mb-15">
            <span class="input-group-addon" id="basic-addon1">用户名</span>
            <input type="text" class="form-control" placeholder="用户名" v-model="loginAccount.username">
        </div>
        <div class="input-group mb-15">
            <span class="input-group-addon" id="basic-addon1"> 密 码 </span>
            <input type="text" class="form-control" placeholder="密码" v-model="loginAccount.password">  
        </div>
        <div class="btn btn-primary col-md-12" v-on:click="login">登录</div>
        </div>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                loginAccount: {
                    username: '',
                    password: ''
                },
                currentAccount : {
                    id:'',
                    username: '',
                    password: ''
                }
            }
        },
        computed :{
            mapGetters({
                currentAccount : 'account'
            })
        }
        methods: {
            login() {
                this.$store.dispatch('updateAccount', this.loginAccount);
                // var data = { 
                //     'data': {
                //         'username': this.username,
                //         'password': this.password
                //     }
                // };
                // this.$http.post('http://localhost:8081/wechat-education-system/admin/login.action', data).then((resp) => {
                //     console.log(resp.body);
                // },() => {
                //     console.log('error');
                // });
            }
        },
        watch: {
            currentAccount: function(newValue, oldValue){
                if(newValue.id != ''){
                    
                }
            }
        }
    }
</script>