<template>
  <div class="container">
      <el-row :gutter="16">
          <el-col :span="16">
            <slideShow></slideShow>
          </el-col>
          <el-col :span="8">
            <login></login>
          </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <news :title="new1" :type="type1"></news>
        </el-col>
        <el-col :span="12">
          <news :title="new2" :type="type2"></news>
        </el-col>
      </el-row>
      <div class="footer">
          <p class="footer-contact">乐学教育 版权所有</p>
          <p class="footer-contact">地址：广东省广州市天河区五山路483号 乐学教育 邮编：510642 电话：020-85280071 传真：020-85281885 Email:kyc@quxue.edu.cn</p>
      </div>
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
        type1: 2,
        new2: '班级活动',
        type2: 1
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
  .footer {
      width: 100%;
      line-height: 30px;
      min-height: 120px;
  }
  .footer-contact {
      font-size: 12px;
      color: #666;
      text-align: center;
  }
</style>