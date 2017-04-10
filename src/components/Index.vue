<template>  
    <div>
        <el-menu v-bind:theme="loginStatus ? 'dark' : '' " mode="horizontal">
            <el-row>
                <el-col :span="17">
                    <el-menu-item index="0">
                        <h3 class="nav-title"><i class="el-icon-star-off"></i> 爱学习教育</h3>
                    </el-menu-item>
                </el-col>
                <el-col :span="7" v-if="!loginStatus">    
                    <router-link to="/management/index/home"><el-menu-item index="1">首页</el-menu-item></router-link>
                    <router-link to="/management/index/teacherInfo"><el-menu-item index="2">师资力量</el-menu-item></router-link>
                    <router-link to="/management/index/fileDownload"><el-menu-item index="3">资料下载</el-menu-item></router-link>
                    <router-link to="/management/index/contact"><el-menu-item index="4">联系我们</el-menu-item></router-link>
                </el-col>
                <el-col :span="7" v-if="loginStatus">
                    <el-menu-item index="0">
                        <h3 class="nav-title">{{account.username}}{{typeMap[account.type]}}, 欢迎你</h3>   
                    </el-menu-item>
                    <router-link to="/management/index/home"><el-menu-item index="5"  @click="logout();$store.dispatch('changeLoginStatis');">登出</el-menu-item></router-link>                    
                </el-col>
            </el-row>
        </el-menu>
        <router-view></router-view>
    </div>
</template>
<style lang="scss">
  .container{
    width: 70%;
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

    import * as Util from '../store/util'

    export default {
        data() {
            return {
                name: 'app',
                typeMap: {
                    1: '同学',
                    2: '老师',
                    3: '管理员'
                }
            }
        },
        computed : mapGetters({
            loginStatus : 'getLoginStatus',
            account: 'getCurrentAccount'
        }),
        methods: {
            logout() {
                const url = '/logout.action';
                Util.get({ url });
            }
        }
    }

</script>