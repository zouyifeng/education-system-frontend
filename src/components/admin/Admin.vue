<template>
    <div>
        <el-row>
            <el-col :span="4">
                <el-menu class="el-menu-vertical-demo" theme="dark">
                    <el-menu-item-group title="分组一">
                        <el-menu-item index="1">
                            <i class="el-icon-message"></i>
                            <router-link to="/admin/news">新闻管理</router-link>
                        </el-menu-item>
                        <el-menu-item index="2">
                            <i class="el-icon-message"></i>
                            <router-link to="/admin/teacher">教师管理</router-link>
                        </el-menu-item>
                        <el-menu-item index="3">
                            <i class="el-icon-message"></i>
                            <router-link to="/admin/student">学生管理</router-link>
                        </el-menu-item>
                        <el-menu-item index="4">
                            <i class="el-icon-message"></i>
                            <router-link to="/admin/classes">班级管理</router-link>
                        </el-menu-item>
                    </el-menu-item-group>
                </el-menu>
            </el-col>
            <el-col :span="18">
                <router-view></router-view>    
            </el-col>
        </el-row>
    </div>
</template>