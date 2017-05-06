<template>
    <el-col :span="24" class="mb-15">
        <el-form :inline="true" style="width: 100%">
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
                <el-button type="danger" @click="addTeacher()">指派</el-button>         
            </el-form-item>
        </el-form>
        <el-table :data="data.list" stripe style="width: 100%" class="mb-15" @selection-change="handleSelectionChange">
            <el-table-column
                type="selection"
                width="55">
            </el-table-column>
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column prop="telephone" label="电话"></el-table-column>
            <el-table-column prop="majorName" label="专业"></el-table-column>
            <el-table-column prop="introduction" label="简介"></el-table-column>
        </el-table>
        <div class="pull-right">
            <el-pagination
                small
                layout="total,prev, pager, next"
                :current-page="data.pageInfo.pageNum"
                :page-size="6"
                :total="data.pageInfo.total"
                @current-change="data.pageInfo.pageNum=arguments[0];nextPage()">
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
                    majorName: ''
                },
                selectedTeacher: []
            }
        },
        computed: mapGetters({
            data: 'getAdminTeacherList',
            dialogFormVisible : 'getEditDialogVisible'
        }),
        created() {
            this.$store.dispatch('fetchAdminTeacherList', {pageInfo: {pageNum: 1}})
        },
        methods: {
            searchTeacher() {
                this.$store.dispatch('searchTeacher', {data: this.search});
            },
            addTeacher() {  
                const url = '/admin/classes_add_teacher.action';
                Util.post({ url }, {data: { teacher: this.selectedTeacher, classes: {id: this.$route.params.id} } })
                    .then((resp) => { 
                        this.$notify.success({
                            message: '指派成功！',
                            type: resp.data.msg,
                            offset: 100                  
                        });
                    });
                this.$store.dispatch('closeEditDialogVisible');                
            },
            handleSelectionChange(teachers) {
                this.selectedTeacher = teachers;
            },
            nextPage(){
                this.$store.dispatch('fetchAdminTeacherList',{pageInfo: this.data.pageInfo })
            }
        }
    }
</script>