<template>
  <div class="container">
      <el-row :gutter="20">
          <el-col :span="16">
            <div>轮播图</div>
          </el-col>
          <el-col :span="8">
            <login></login>
          </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="6">
        <div>日历</div>
        </el-col>
        <el-col :span="18">
          <news></news>
        </el-col>
      </el-row>
  </div>
</template>

<script>
  //   import Sidebar from '../Sidebar'
  import Login from './Login'
  import News from './News'
  // import SlideShow from './SlideShow'
  //   import HeaderComponent from './HeaderComponent'

  export default {
    components: {
    //   'Sidebar': Sidebar,
      'Login': Login,
      'News': News,
      // 'SlideShow' : SlideShow
    //   'HeaderComponent': HeaderComponent
    }
  }
</script>

<style>
  .mb-15 {
    margin-bottom: 15px;
  }
</style>