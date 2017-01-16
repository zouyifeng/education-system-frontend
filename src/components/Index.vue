<template>
  <div id="wrapper">
    <nav class="navbar navbar-default">
      <div class="container">
        <a class="navbar-brand" href="#">
          <i class="glyphicon glyphicon-time"></i>  基于微信教务系统
        </a>
        <ul class="nav navbar-nav navbar-right">
          <li>  
            <a href="#">退出</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="container"> 
      <div class="col-sm-3"> 
        <sidebar></sidebar>
      </div>
      <div class="col-sm-9">
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<script>
  import Sidebar from './Sidebar.vue'
  export default {
    name: 'app',
    components: {
      'Sidebar' : Sidebar
    }
  }
</script>