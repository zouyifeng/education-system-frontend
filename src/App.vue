<template>
    <div id="app">  
        <el-menu theme="dark" :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
            <el-row>
                <el-col :span="3">
                    <el-menu-item>
                        <i class="el-icon-time"></i> 教务系统
                    </el-menu-item>
                </el-col>
                <el-col :span="9" :offset="12">
                    <el-menu-item index="1"><router-link to="/index/home">首页</router-link></el-menu-item>
                    <el-menu-item index="2"><router-link to="/index/teacherInfo">师资力量</router-link></el-menu-item>
                    <el-menu-item index="3"><router-link to="/index/classInfo">班级风采</router-link></el-menu-item>
                    <el-menu-item index="4"><router-link to="/index/contact">联系方式</router-link></el-menu-item>
                </el-col>
            </el-row>
        </el-menu>
        <router-view></router-view>
    </div>
</template >
    <script>
        // import Sidebar from '../Sidebar'
        // import Login from './index/Login'
        // import ClassActivity from './index/ClassActivity'
        // import HeaderComponent from './index/home/HeaderComponent'

        export default {
            name: 'app',
            components: {
                    // 'Sidebar': Sidebar,
                    // 'Login': Login,
                    // 'ClassActivity': ClassActivity,
                    // 'HeaderComponent': HeaderComponent
            }
        }

</script>

<style>

</style>