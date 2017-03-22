<template>

    <div id="app">  
        <el-menu theme="dark" mode="horizontal">
            <el-row>
                <el-col :span="17">
                    <el-menu-item>
                        <i class="el-icon-time"></i> 教务系统
                    </el-menu-item>
                </el-col>
                <el-col :span="7">    
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
    width: 70%;
    margin: 40px auto;
  }
</style>
<script>

    export default {
        name: 'app'
    }

</script>

<style>

</style>