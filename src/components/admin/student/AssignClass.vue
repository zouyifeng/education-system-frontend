<template>  
    <el-col :span="23" :offset="1">
        <el-form :inline="true" :model="classes" class="demo-form-inline mt-15">
            <el-form-item label="班级名称">
                <el-input v-model="classes.subject" placeholder="班级名称" ></el-input>
            </el-form-item>
            <el-form-item label="班级简介">
                <el-input v-model="classes.sumary" placeholder="班级简介"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="search">查询</el-button>
            </el-form-item>
        </el-form>
        <el-form :inline="true">
            <el-form-item label="已报班级">
                <el-tag
                    class="mr-15"
                    v-for="item in person.classes"
                    type="primary"
                    >
                    {{item.subject}}
                </el-tag>
            </el-form-item>
        </el-form>
        <el-table :data="data.list" v-loading.body="data.list.length == 0" stripe style="width: 100%">
            <el-table-column type="index" width="80" label="序号"></el-table-column>
            <el-table-column prop="subject" label="班级名称"></el-table-column>
            <el-table-column prop="sumary" label="班级简介"></el-table-column>
            <el-table-column prop="date" label="创建日期"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="danger" @click="assignClasses(scope.row)">报名</el-button>
                </template>
            </el-table-column>
        </el-table>
        <div class="pull-right block mt-15">
            <el-pagination
                layout="total, prev, pager, next"
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
            return {
                classes : {
                    subject: '',
                    context: ''
                },
                pageConfig: {
                    dialogFormVisible: false,
                    confirmDeleteVisible: false
                },
                person: {
                    classes: []
                },
                newClass:[]
            }
        },
        computed: mapGetters({
            data: 'getAdminClassesList',
            currentAccount: 'getCurrentAccount'
        }),
        created() {
            this.fetchPersonDetail();            
            this.$store.dispatch('fetchAdminClassesList', {data: {}, pageInfo: {pageNum: 1}})
        },
        methods: {
            assignClasses(item) {
                this.person.classes.push(item);
                var actionTypeStr = this.currentAccount.type == 1 ? 'editStudent' : 'editTeacher';

                this.$store.dispatch(actionTypeStr, {data: this.person}).then((resp) => {
                    this.$notify.success({
                        title: '报班成功',
                        offset: 100,
                        duration: 0
                    });
                });
            },
            search() {
                this.$store.dispatch('searchClasses', {data: this.classes});
            },
            nextPage(page) {
                this.data.pageInfo.pageNum = page;
                this.$store.dispatch('fetchAdminClassesList',{ data: {}, pageInfo: this.data.pageInfo })
            },
            fetchPersonDetail() {
                 const that = this;
                 if(this.currentAccount.type == 1) {
                    this.$store.dispatch('fetchStudentDetail', {data: {id: this.currentAccount.userId}}).then((resp)=>{
                        that.person = resp.data.data;
                    });
                 }else if(this.currentAccount.type == 2) {
                    this.$store.dispatch('fetchAdminTeacherDetail', {data: {id: this.currentAccount.userId}}).then((resp)=>{
                        that.person = resp.data.data;
                    });
                 }
            }
        }
    }
</script>
