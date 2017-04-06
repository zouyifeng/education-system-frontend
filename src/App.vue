<template>
    <div id="app">  
        <el-menu v-bind:theme="loginStatus ? 'dark' : '' " mode="horizontal">
            <el-row>
                <el-col :span="17">
                    <el-menu-item index="0">
                        <h3 class="nav-title"><i class="el-icon-star-off"></i> 趣学教育</h3>
                    </el-menu-item>
                </el-col>
                <el-col :span="7" v-if="!loginStatus">    
                    <router-link to="/index/home"><el-menu-item index="1">首页</el-menu-item></router-link>
                    <router-link to="/index/teacherInfo"><el-menu-item index="2">师资力量</el-menu-item></router-link>
                    <router-link to="/index/fileDownload"><el-menu-item index="3">资料下载</el-menu-item></router-link>
                    <router-link to="/index/contact"><el-menu-item index="4">联系我们</el-menu-item></router-link>
                </el-col>
                <el-col :span="7" v-if="loginStatus">
                    <el-menu-item index="0">
                        <h2 class="nav-title" v-text="account.username"></h2>   
                    </el-menu-item>
                    <router-link to="/index/home"><el-menu-item index="5"  @click="logout();$store.dispatch('changeLoginStatis');">登出</el-menu-item></router-link>                    
                </el-col>
            </el-row>
        </el-menu>
        <router-view></router-view>
    </div>
</template>
<style lang="scss">
  .container{
    width: 66%;
    margin: 30px auto;
    color: #615454;
  }
  .nav-title {
      margin: 0;
      font-weight: normal;
  }
</style>
<script>

    import { mapGetters } from 'vuex'

    import * as Util from './store/util'

    export default {
        data() {
            return {
                name: 'app'
            }
        },
        computed : mapGetters({
            loginStatus : 'getLoginStatus',
            account: 'getCurrentAccount'
        }),
        methods: {
            logout() {
                console.log('logout')
                const url = '/logout.action';
                Util.get({ url });
            }
        }
    }

</script>