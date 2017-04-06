<template>
    <el-col :span="23" :offset="1">
        <el-form :inline="true" :model="search" class="mt-15" style="width: 100%">
            <el-form-item label="姓名">
                <el-input v-model="search.name" placeholder="姓名"></el-input>
            </el-form-item>
            <el-form-item label="学习科目">
                <el-input v-model="search.school" placeholder="就读学校"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="searchStudent">查询</el-button>
            </el-form-item>
            <el-form-item>         
                <el-button type="primary" @click="openDialog()">新增</el-button>              
            </el-form-item>
        </el-form>
        <el-table :data="data.list" stripe style="width: 100%">
            <el-table-column type="index" label="序号" width="80px"></el-table-column>
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column prop="parentName" label="父母姓名"></el-table-column>
            <el-table-column prop="school" label="就读学校"></el-table-column>
            <el-table-column prop="telephone" label="电话"></el-table-column>
            <el-table-column prop="introduction" label="简介"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="primary" @click="openDialog(scope.row.id)">编辑</el-button>         
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
                @current-change="data.pageInfo.pageNum=arguments[0];nextPage(1)">
            </el-pagination>
        </div>
        <el-dialog title="编辑学生" v-model="dialogFormVisible" size="small" @close="$store.dispatch('closeEditDialogVisible');">
            <editStudent :studentId="selectedId"></editStudent>
        </el-dialog>
    </el-col>
</template>
<script>    
    import { mapGetters } from 'vuex'
    import EditStudent from './EditStudent'

    export default {
        data() {
            return{
                search: {  
                    name: '',
                    direction: ''
                },
                selectedId: ''
            }
        },
        computed: mapGetters({
            data: 'getAdminStudentList',
            dialogFormVisible : 'getEditDialogVisible'
        }),
        created() {
            this.$store.dispatch('fetchAdminStudentList', {pageInfo: {pageNum: 1}})
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
                    this.$store.dispatch('fetchAdminStudentList', {pageInfo: {pageNum: 1}})
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
            openDialog(id){
                this.selectedId = id || '';
                this.$store.dispatch('openEditDialogVisible');
            },
            nextPage(){
                this.$store.dispatch('fetchAdminStudentList',{pageInfo: this.data.pageInfo })
            }
        },
        components: {
            'editStudent':　EditStudent
        }
    }
</script>