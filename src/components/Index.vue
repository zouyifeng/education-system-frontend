<template>
  <div>
    <nav class="navbar navbar-default">
        <header-component></header-component>
    </nav>
    <div class="container">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
  // import Sidebar from '../Sidebar'
  // import Login from './index/Login'
  // import ClassActivity from './index/ClassActivity'
  import HeaderComponent from './index/home/HeaderComponent'

  export default {
    name: 'app',
    components: {
      // 'Sidebar': Sidebar,
      // 'Login': Login,
      // 'ClassActivity': ClassActivity,
      'HeaderComponent': HeaderComponent
    }
  }

</script>

<style>
  .mb-15 {
    margin-bottom: 15px;
  }
</style>