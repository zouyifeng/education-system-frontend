<template>
    <el-col :span="23" :offset="1">
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
                <el-button @click="openDialog()">新增</el-button>              
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
                    <el-button size="small" type="normal" @click="openDialog(scope.row.id)">编辑</el-button>         
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
        <el-dialog title="编辑学生" v-model="dialogFormVisible">
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
                    direction: '',
                    type: 1
                },
                selectedId: ''
            }
        },
        computed: mapGetters({
            data: 'getAdminStudentList',
            dialogFormVisible : 'getEditDialogVisible'
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
            openDialog(id){
                this.selectedId = id || '';
                this.$store.dispatch('changeEditDialogVisible');
            },
            nextPage(page){
                this.data.pageInfo.pageNum = page;
                this.$store.dispatch('fetchAdminStudentList',{ data: {type: 1}, pageInfo: this.data.pageInfo })
            }
        },
        components: {
            'editStudent':　EditStudent
        }
    }
</script>