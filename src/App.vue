<template>

    <div id="app">  
        <el-menu theme="dark" mode="horizontal">
            <el-row>
                <el-col :span="17">
                    <el-menu-item>
                        <h1 class="nav-title"><i class="el-icon-star-off"></i> 趣学教育</h1>
                    </el-menu-item>
                </el-col>
                <el-col :span="7">    /
                    <router-link to="/index/home"><el-menu-item index="1">首页</el-menu-item></router-link>
                    <router-link to="/index/teacherInfo"><el-menu-item index="2">师资力量</el-menu-item></router-link>
                    <router-link to="/index/classInfo"><el-menu-item index="3">资料下载</el-menu-item></router-link>
                    <router-link to="/index/contact"><el-menu-item index="4">联系我们</el-menu-item></router-link>
                </el-col>
            </el-row>
        </el-menu>
        <router-view></router-view>
    </div>
</template>
<style>
  .container{
    width: 86%;
    margin: 40px auto;
  }
  .nav-title {
      font-size: 18px;
      margin: 0;
      font-weight: normal;
  }
  li {
      list-style: none;
  }
  ul, li {
      margin: 0;
      padding: 0;
  }
</style>
<script>

    export default {
        name: 'app'
    }

</script>

<style>

</style>