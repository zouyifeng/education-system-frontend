<template>
    <el-col :span="23" :offset="1">
        <el-form :inline="true" :model="search" style="width: 100%" class="mt-15">
            <el-form-item label="姓名">
                <el-input v-model="search.name" placeholder="姓名"></el-input>
            </el-form-item>
            <el-form-item label="专业">
                <el-input v-model="search.majorName" placeholder="专业"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="searchTeacher">查询</el-button>
            </el-form-item>
            <el-form-item>                
                <el-button type="primary" @click="openDialog()">新增</el-button>              
            </el-form-item>
        </el-form>
        <el-table :data="data.list" stripe style="width: 100%">
            <el-table-column type="index" label="序号" width="80px"></el-table-column>
            <el-table-column prop="name" label="姓名" ></el-table-column>
            <el-table-column prop="telephone" label="联系方式"></el-table-column>
            <el-table-column prop="majorName" label="专业"></el-table-column>
            <el-table-column prop="introduction" label="介绍"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="primary" @click="openDialog(scope.row.id)">编辑</el-button>          
                    <el-button size="small" type="danger" @click="deleteTeacher(scope.row.id)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <div class="pull-right block mt-15">
            <el-pagination
                layout="sizes, total,prev, pager, next"
                :current-page="data.pageInfo.pageNum"
                :total="data.pageInfo.total"  
                :page-sizes="[10, 15, 20]"              
                :page-size="data.pageInfo.pageSize"
                @current-change="data.pageInfo.pageNum=arguments[0];nextPage()"
                @size-change="data.pageInfo.pageSize=arguments[0];nextPage()">
            </el-pagination>
        </div>
        <el-dialog title="编辑教师" v-model="dialogFormVisible" @close="$store.dispatch('closeEditDialogVisible');">
            <editteacher :teacherId="selectedId"></editteacher>
        </el-dialog>
    </el-col>
</template>
<script>    
    import { mapGetters } from 'vuex'
    import EditTeacher from './EditTeacher'

    export default {
        data() {
            return{
                search: {  
                    name: '',
                    majorName: ''
                } ,
                pageConfig: {
                    dialogVisible: false,
                    dialogImageUrl: ''
                },
                selectedId: ''
            }
        },
        computed: mapGetters({
            data: 'getAdminTeacherList',
            dialogFormVisible : 'getEditDialogVisible'
        }),
        created() {
            // console.log(this.data)
            this.$store.dispatch('fetchAdminTeacherList', { pageInfo: this.data.pageInfo})
        },
        methods: {
            deleteTeacher(id) {
                var data = {id: id};
                this.$store.dispatch('deleteTeacher', {data: data}).then((resp)=>{
                    this.$notify.success({
                        title: '删除成功',
                        message: '你已经成功删除一条记录',
                        offset: 100
                    });
                    this.$store.dispatch('fetchAdminTeacherList', {pageInfo: {pageNum: 1}})
                },(resp)=>{
                    this.$notify.error({
                        title: '删除失败',
                        offset: 100
                    });
                })
            },
            searchTeacher() {
                this.$store.dispatch('searchTeacher', {data: this.search, pageInfo: {pageNum: 1, pageSize: this.data.pageInfo.pageSize}});
            },
            openDialog(id) {
                this.selectedId = id || '';
                this.$store.dispatch('openEditDialogVisible');
            },
            nextPage() {
                this.$store.dispatch('fetchAdminTeacherList',{ pageInfo: this.data.pageInfo })
            }
        },
        components: {
            'editteacher': EditTeacher
        }
    }
</script>