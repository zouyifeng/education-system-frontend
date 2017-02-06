<template>
  <div id="app">
    <nav class="navbar navbar-default">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="glyphicon glyphicon-time"></i> 基于微信教务系统
            </a>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <router-link to="/index/home">首页</router-link>
                </li>
                <li>
                    <router-link to="/index/teacherInfo">师资力量</router-link>
                </li>
                <li>
                    <router-link to="/index/classInfo">班级风采</router-link>
                </li>
                <li>
                    <router-link to="/index/contact">联系方式</router-link>
                </li>
            </ul>
        </div>
    </nav>
    <router-view></router-view>
  </div>
</template>

<script>
  // import Sidebar from '../Sidebar'
  // import Login from './index/Login'
  // import ClassActivity from './index/ClassActivity'
  // import HeaderComponent from './index/home/HeaderComponent'

  export default {
    name: 'app',
    components: {
      // 'Sidebar': Sidebar,
      // 'Login': Login,
      // 'ClassActivity': ClassActivity,
      // 'HeaderComponent': HeaderComponent
    }
  }

</script>

<style>
  .mb-15 {
    margin-bottom: 15px;
  }
</style>