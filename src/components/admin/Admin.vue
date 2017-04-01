<template>
    <el-row>
        <el-col :span="4">
            <el-menu class="el-menu-vertical-demo" theme="dark">
                 <el-submenu index="1">
                    <template slot="title"><i class="el-icon-message"></i>新闻管理</template>
                    <el-menu-item-group>
                        <router-link to="/admin/news">
                            <el-menu-item index="1-1">
                                <i class="el-icon-share"></i>
                                新闻列表
                            </el-menu-item>
                        </router-link>
                        <router-link to="/admin/addNews">
                            <el-menu-item index="1-2">
                                <i class="el-icon-more"></i>
                                新增新闻
                            </el-menu-item>
                        </router-link>
                    </el-menu-item-group>
                </el-submenu>
                
                <router-link to="/admin/teacher">
                    <el-menu-item index="2">
                        <i class="el-icon-edit"></i>
                        教师管理
                    </el-menu-item>
                </router-link>
                <router-link to="/admin/student">
                    <el-menu-item index="3">
                        <i class="el-icon-star-on"></i>
                        学生管理
                    </el-menu-item>
                </router-link>
                <el-submenu index="4">
                    <template slot="title"><i class="el-icon-message"></i>班级管理</template>
                    <el-menu-item-group>
                        <router-link to="/admin/classes">
                            <el-menu-item index="4-1">
                                <i class="el-icon-menu"></i>
                                班级列表
                            </el-menu-item>
                        </router-link>
                        <router-link to="/admin/classActivity">
                            <el-menu-item index="4-2">
                                <i class="el-icon-document"></i>
                                班级活动
                            </el-menu-item>
                        </router-link>
                    </el-menu-item-group>
                </el-submenu>
                <router-link to="/admin/message">
                    <el-menu-item index="5">
                        <i class="el-icon-information"></i>
                        留言管理
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
