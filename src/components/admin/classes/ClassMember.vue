<template>
    <el-col :span="23" :offset="1">
        <el-form :inline="true" style="width: 100%">
            <el-form-item>
                <el-button type="primary" @click="openDialog">增加学生</el-button>
            </el-form-item>
        </el-form>
        <el-table :data="existedStudent" stripe style="width: 100%" class="mb-15">
            <el-table-column prop="code" label="学号"></el-table-column>
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column prop="parentName" label="父母姓名"></el-table-column>
            <el-table-column prop="school" label="就读学校"></el-table-column>
            <el-table-column prop="telephone" label="电话"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="danger" @click="deleteStudent(scope.row.id)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-dialog title="学生列表" v-model="dialogFormVisible" size="small" @close="$store.dispatch('closeEditDialogVisible')">
            <studentlist></studentlist>
        </el-dialog>
        <el-form :inline="true" style="width: 100%">
            <el-form-item>
                <el-button type="success" @click="openDialog">增加教师</el-button>
            </el-form-item>
        </el-form>
        <el-table :data="existedTeacher" stripe style="width: 100%">
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column prop="email" label="email"></el-table-column>
            <el-table-column prop="introduction" label="介绍"></el-table-column>
            <el-table-column prop="telephone" label="电话"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="danger" @click="deleteTeacher(scope.row.id)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

    </el-col>
</template>
<script>    
    import { mapGetters } from 'vuex'

    import TeacherList from './TeacherList'
    import StudentList from './StudentList'

    import * as Util from '../../../store/util'

    export default {
        data() { 
            return {
                existedStudent: [],
                existedTeacher: []
            }
        },
        components: {
            'studentlist': StudentList,
            'teacherlist': TeacherList
        },
        computed: mapGetters({
            dialogFormVisible : 'getEditDialogVisible'
        }),
        created() {
            this.fetchExistedStudentList();
            this.fetchExistedTeacherList();
        },
        methods: {
            openDialog() {
                this.$store.dispatch('openEditDialogVisible');
            },
            deleteStudent(id) {
                var that = this;
                const url = '/admin/classes_delete_student.action';
                 Util.post({ url }, {data: { type: 1, classesId: this.$route.params.id, userId: id} })
                    .then((resp) => { 
                        // console.log(resp.body.data)
                        that.fetchExistedStudentList();
                        this.$notify.success({
                            message: '删除成功！',
                            type: 'error',
                            offset: 100                   
                        });
                    });
            },
            deleteTeacher(id) {
                var that = this;
                const url = '/admin/classes_delete_teacher.action';
                 Util.post({ url }, {data: { type: 2, classesId: this.$route.params.id, userId: id} })
                    .then((resp) => { 
                        // console.log(resp.body.data)
                        that.fetchExistedTeacherList();
                        this.$notify.success({
                            message: '删除成功！',
                            type: 'error',
                            offset: 100                   
                        });
                    });
            },
            fetchExistedStudentList() {
                const url = '/admin/classes_student.action';
                Util.post({ url }, {data: { type: 1, classesId: this.$route.params.id } })
                    .then((resp) => { 
                        console.log(resp.body.data)
                        this.existedStudent = resp.body.data;
                    });
            },
            fetchExistedTeacherList() {
                const url = '/admin/classes_teacher.action';
                Util.post({ url } , {data: { type: 2, classesId: this.$route.params.id }})
                    .then((resp) => { 
                        this.existedTeacher = resp.body.data;
                    });
            },
            openDialog(id){
                this.selectedId = id || '';
                this.$store.dispatch('openEditDialogVisible');
            },
            nextPage(type){
                if(type == 1) {
                    const url = '/admin/classes_student.action' ;
                    Util.post( { url } , {data: { type: 1, classesId: this.$route.params.id }, pageInfo:this.existedStudent.pageInfo} ).then((resp) => { 
                        this.existedStudent = resp.data;
                    });
                } else if(type == 2) {
                    const url = '/admin/classes_teacher.action' ;
                    Util.post( { url } , {data: { type: 2, classesId: this.$route.params.id }, pageInfo:this.existedTeacher.pageInfo} ).then((resp) => { 
                        this.existedTeacher = resp.data;
                    });
                }
            }
        }
    }
</script>
