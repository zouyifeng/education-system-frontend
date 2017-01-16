<template>
    <!--<div class="panel panel-default">
    <div class="panel-heading">
      <h1 class="text-center">已有时长</h1>
    </div>

    <div class="panel-body">
      <h1 class="text-center">{{ time }} 小时</h1>
    </div>-->
    <div class="list-group">
      <li href="#" class="list-group-item  active">菜单栏</li>
      <router-link class="list-group-item" to="/home">首页</router-link></a>
      <router-link class="list-group-item" to="/time-entries">班级管理</router-link>
      <router-link class="list-group-item" to="/time-entries">教师管理</router-link>
      <router-link class="list-group-item" to="/time-entries">学生管理</router-link>
    </div>

  </div>
</template>

<script>
  export default {
    computed: {
        time() {
          return this.$store.state.totalTime
        }
      }
  }
</script>