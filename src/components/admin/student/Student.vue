<template>
    <el-col :span="22" :offset="1">
        <el-form :inline="true" :model="search" class="mt-15" style="width: 100%">
            <el-form-item label="姓名">
                <el-input v-model="search.name" placeholder="姓名"></el-input>
            </el-form-item>
            <el-form-item label="学习科目">
                <el-input v-model="search.direction" placeholder="学习科目"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="searchStudent">查询</el-button>
            </el-form-item>
            <el-form-item>                
                <router-link :to="{ name :'addStudent'}"><el-button>新增</el-button></router-link>                   
            </el-form-item>
        </el-form>
        <el-table :data="data.list" stripe style="width: 100%">
            <el-table-column type="index" label="序号" width="80px"></el-table-column>
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column prop="email" label="邮箱"></el-table-column>
            <el-table-column prop="telephone" label="联系方式"></el-table-column>
            <el-table-column prop="direction" label="学习科目"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <router-link class="btn btn-default" :to="{ name :'editStudent', params: { id: scope.row.id }}"><el-button size="small">编辑</el-button></router-link>
                    <el-button size="small" type="danger" @click="deleteStudent(scope.row.id)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <div class="pull-right mt-15">
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

    export default {
        data() {
            return{
                search: {  
                    name: '',
                    direction: '',
                    type: 1
                } 
            }
        },
        computed: mapGetters({
            data: 'getAdminStudentList'
        }),
        created() {
            this.$store.dispatch('fetchAdminStudentList', {data: {type: 1}, pageInfo: {pageNum: 1}})
        },
        methods: {
            deleteStudent(id) {
                var data = {id: id};
                this.$store.dispatch('deleteStudent', {data: data}).then((resp)=>{
                    this.$notify.success({
                        title: '删除成功',
                        message: resp.data.data.message,
                        offset: 100
                    });
                    this.$store.dispatch('fetchAdminStudentList', {data:{type: 1}, pageInfo: {pageNum: 1}})
                },()=>{
                    this.$notify.success({
                        message: '删除失败！',
                        type: 'error',
                        offset: 100                        
                    });
                })
            },
            searchStudent() {
                this.$store.dispatch('searchStudent', {data: this.search});
            },
            nextPage(page){
                this.data.pageInfo.pageNum = page;
                this.$store.dispatch('fetchAdminStudentList',{ data: {type: 1}, pageInfo: this.data.pageInfo })
            }
        }
    }
</script>