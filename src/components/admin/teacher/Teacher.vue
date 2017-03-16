<template>
    <el-col :span="22" :offset="1">
        <el-form :inline="true" :model="search" style="width: 100%">
            <el-form-item label="标题">
                <el-input v-model="search.name" placeholder="标题" v-class="block"></el-input>
            </el-form-item>
            <el-form-item label="作者">
                <el-input v-model="search.direction" placeholder="研究方向"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="search">查询</el-button>
            </el-form-item>
        </el-form>
        <el-table :data="data.list" stripe style="width: 100%">
            <el-table-column type="index" label="序号" width="80px"></el-table-column>
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column prop="email" label="邮箱"></el-table-column>
            <el-table-column prop="telephone" label="联系方式"></el-table-column>
            <el-table-column prop="direction" label="研究方向"></el-table-column>
            <el-table-column prop="introduction" label="介绍"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="danger" @click="deleteTeacher(scope.row.id)">删除</el-button>
                    <router-link class="btn btn-default" :to="{ name :'editTeacher', params: { id: scope.row.id }}">编辑</router-link>                   
                </template>
            </el-table-column>
        </el-table>
        <div class="pull-right block">
            <el-pagination
                layout="total,prev, pager, next"
                :current-page="data.pageInfo.pageNum"
                :page-size="6"
                :total="data.pageInfo.total"
                @current-change="nextPage">
            </el-pagination>
        </div>
    </el-col>
</template>
<script>    
    import { mapGetters } from 'vuex'

    import page from '../../common/page'

    export default {
        data() {
            return{
                search: {  
                    name: '',
                    direction: ''
                } 
            }
        },
        computed: mapGetters({
            data: 'getAdminTeacherList'
        }),
        created() {
            this.$store.dispatch('fetchAdminTeacherList', {data: {type: 1}, pageInfo: {pageNum: 1}})
        },
        methods: {
            deleteTeacher(id) {
                var data = {id: id};
                this.$store.dispatch('deleteTeacher', {data: data}).then((resp)=>{
                    this.$message({
                        message: '删除成功！'
                    });
                    this.$store.dispatch('fetchAdminTeacherList', {data:{type: 1}, pageInfo: {pageNum: 1}})
                },()=>{
                    this.$message({
                        message: '删除失败！',
                        type: 'error'
                    });
                })
            },
            editTeacher(id) {

            },
            searchTeacher() {
                this.$store.dispatch('searchTeacher', {data: this.search});
            },
            nextPage(page){
                this.data.pageInfo.pageNum = page;
                this.$store.dispatch('fetchAdminTeacherList',{ data: {type: 1}, pageInfo: this.data.pageInfo })
            }
        },
        components: {
            'page': page
        }
    }

</script>