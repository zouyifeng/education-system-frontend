<template>
    <el-row>
        <el-col :span="4">
            <el-menu class="el-menu-vertical-demo" theme="dark" style="min-height: 400px">
                 <el-submenu index="1" v-if="currentAccount.type == 3">
                    <template slot="title"><i class="el-icon-message"></i>新闻管理</template>
                    <el-menu-item-group>
                        <router-link to="/management/admin/news">
                            <el-menu-item index="1-1">
                                <i class="el-icon-share"></i>
                                新闻列表
                            </el-menu-item>
                        </router-link>
                        <router-link to="/management/admin/addNews">
                            <el-menu-item index="1-2">
                                <i class="el-icon-star-on"></i>
                                新增新闻
                            </el-menu-item>
                        </router-link>
                    </el-menu-item-group>
                </el-submenu>
                
                <router-link to="/management/admin/teacher" v-if="currentAccount.type == 3">
                    <el-menu-item index="2">
                        <i class="el-icon-edit"></i>
                        教师管理
                    </el-menu-item>
                </router-link>
                <router-link to="/management/admin/student" v-if="currentAccount.type == 3">
                    <el-menu-item index="3">
                        <i class="el-icon-star-on"></i>
                        学生管理
                    </el-menu-item>
                </router-link>
                <el-submenu index="4" v-if="currentAccount.type == 3">
                    <template slot="title"><i class="el-icon-document"></i>班级管理</template>
                    <el-menu-item-group>
                        <router-link to="/management/admin/classes">
                            <el-menu-item index="4-1">
                                <i class="el-icon-menu"></i>
                                班级列表
                            </el-menu-item>
                        </router-link>
                        <router-link to="/management/admin/classActivity">
                            <el-menu-item index="4-2">
                                <i class="el-icon-date"></i>
                                班级活动
                            </el-menu-item>
                        </router-link>
                    </el-menu-item-group>
                </el-submenu>
                <router-link to="/management/admin/message" v-if="currentAccount.type == 3">
                    <el-menu-item index="5">
                        <i class="el-icon-information"></i>
                        留言管理
                    </el-menu-item>
                </router-link>
                <router-link to="/management/admin/manager" v-if="currentAccount.type == 3">
                    <el-menu-item index="6">
                        <i class="el-icon-setting"></i>
                        用户管理
                    </el-menu-item>
                </router-link>
                <router-link to="/management/admin/file" v-if="currentAccount.type == 3">
                    <el-menu-item index="7">
                        <i class="el-icon-upload"></i>
                        文件上传
                    </el-menu-item>
                </router-link>
                <router-link to="/management/admin/studentIndex" v-if="currentAccount.type == 1">
                    <el-menu-item index="8">
                        <i class="el-icon-upload"></i>
                        学生主页
                    </el-menu-item>
                </router-link>
                <router-link to="/management/admin/teacherIndex" v-if="currentAccount.type == 2">
                    <el-menu-item index="8">
                        <i class="el-icon-upload"></i>
                        教师主页
                    </el-menu-item>
                </router-link>
            </el-menu>
        </el-col>
        <el-col :span="18">
            <el-row :gutter="20">    
                <router-view></router-view>    
            </el-row>
        </el-col>
    </el-row>
</template>
<style>
    .form-container {
        width: 500px;
    }
    .tab-title {
        color: #444;
        padding-bottom: 5px;
    }
    #editor {
        min-height: 500px;
    }
</style>
<script>
    import { mapGetters } from 'vuex'

    export default {
        computed : mapGetters({
            currentAccount :  'getCurrentAccount'
        })
    }
</script>
