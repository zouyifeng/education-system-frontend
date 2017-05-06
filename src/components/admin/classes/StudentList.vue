<template>
    <el-col :span="24" class="mb-15">
        <el-form :inline="true" style="width: 100%">
            <el-form-item label="姓名">
                <el-input v-model="search.name" placeholder="姓名"></el-input>
            </el-form-item>
            <el-form-item label="就读学校">
                <el-input v-model="search.school" placeholder="就读学校"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="searchStudent">查询</el-button>
            </el-form-item>
            <el-form-item>
                <el-button type="danger" @click="addStudent()">分配</el-button>         
            </el-form-item>
        </el-form>
        <el-table :data="data.list" stripe style="width: 100%" class="mb-15" @selection-change="handleSelectionChange">
            <el-table-column
                type="selection"
                width="55">
            </el-table-column>
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column prop="telephone" label="电话"></el-table-column>
            <el-table-column prop="school" label="学校"></el-table-column>
            <el-table-column prop="introduction" label="简介"></el-table-column>
        </el-table>
        <div class="pull-right">
            <el-pagination
                small
                layout="total,prev, pager, next"
                :current-page="data.pageInfo.pageNum"
                :page-size="6"
                :total="data.pageInfo.total"
                @current-change="data.pageInfo.pageNum=arguments[0]; nextPage()">
            </el-pagination>
        </div>
    </el-col>
</template>
<script>    
    import { mapGetters } from 'vuex'

    import * as Util from '../../../store/util'

    export default {
        data() {
            return{
                search: {  
                    name: '',
                    school: ''
                },
                selectedStudent: []
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
            searchStudent() {
                this.$store.dispatch('searchStudent', {data: this.search});
            },
            addStudent() {  
                const url = '/admin/classes_add_student.action';
                Util.post({ url }, {data: { student: this.selectedStudent, classes: {id: this.$route.params.id} } })
                    .then((resp) => { 
                        this.$notify.success({
                            message: '新增成功！',
                            type: resp.data.msg,
                            offset: 100                  
                        });
                    });
                this.$store.dispatch('closeEditDialogVisible');            
            },
            handleSelectionChange(students) {
                this.selectedStudent = students;
            },
            nextPage(){
                this.$store.dispatch('fetchAdminStudentList',{pageInfo: this.data.pageInfo })
            }
        }
    }
</script>