<template>
  <div id="wrapper">
    <nav class="navbar navbar-default">
      <div class="container">
        <a class="navbar-brand" href="#">
          <i class="glyphicon glyphicon-time"></i>  基于微信教务系统
        </a>
        <ul class="nav navbar-nav navbar-right">
          <li>  
            <a href="#">首页</a>
          </li>
          <li>  
            <a href="#">师资力量</a>
          </li>
          <li>  
            <a href="#">班级风采</a>
          </li>
          <li>  
            <a href="#">联系方式</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="container"> 
      <div class="col-md-3">
        <div class="panel panel-default">
          <div class="panel-heading">
          <h3 class="panel-title">日 历</h3>
          </div>
          <div class="panel-body">
          Panel content
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <class-activity></class-activity>
      </div>
      <div class="col-md-3">
        <login></login>
      </div>
    </div>
  </div>
</template>

<script>
  import Sidebar from '../Sidebar'
  import Login from './login'
  import ClassActivity from './classActivity'
  export default {
    name: 'app',
    components: {
      'Sidebar': Sidebar,
      'Login': Login,
      'ClassActivity': ClassActivity
    }
  }
</script>

<style>
  .mb-15{
    margin-bottom: 15px;
  }
</style>