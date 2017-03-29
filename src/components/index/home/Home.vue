<template>
  <div class="container">
      <el-row :gutter="20">
          <el-col :span="16">
            <slideShow></slideShow>
          </el-col>
          <el-col :span="8">
            <login></login>
          </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="10">
          <news :title="new1" :type="type1"></news>
        </el-col>
        <el-col :span="10">
          <news :title="new2" :type="type2"></news>
        </el-col>
      </el-row>
  </div>
</template>

<script>
  //   import Sidebar from '../Sidebar'
  import Login from './Login'
  import News from './News'
  import SlideShow from './SlideShow'
  //   import HeaderComponent from './HeaderComponent'

  export default {
    data(){
      return {
        new1: '交流活动',
        type1: 1,
        new2: '班级活动',
        type2: 2
      }
    },
    components: {
    //   'Sidebar': Sidebar,
      'Login': Login,
      'News': News,
      'SlideShow' : SlideShow
    //   'HeaderComponent': HeaderComponent
    }
  }
</script>

<style>
  .mb-15 {
    margin-bottom: 15px;
  }
</style>