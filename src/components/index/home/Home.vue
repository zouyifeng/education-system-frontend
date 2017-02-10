<template>
    <div class="container">
      <div class="col-md-9">

      </div>
      <div class="col-md-3">
        <login></login>
      </div>
      <div class="row">
        <!--<slide-show></slide-show>-->
      </div>
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
      <div class="col-md-9">
        <class-activity></class-activity>
      </div>
    </div>
</template>

<script>
  //   import Sidebar from '../Sidebar'
  import Login from './Login'
  import ClassActivity from './ClassActivity'
  // import SlideShow from './SlideShow'
  //   import HeaderComponent from './HeaderComponent'

  export default {
    components: {
    //   'Sidebar': Sidebar,
      'Login': Login,
      'ClassActivity': ClassActivity,
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