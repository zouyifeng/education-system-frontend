<template>  
    <div>
        <el-form :inline="true" :model="classes" class="demo-form-inline" style="width: 100%">
            <el-form-item label="科目">
                <el-input v-model="classes.subject" placeholder="科目"></el-input>
            </el-form-item>
            <el-form-item label="班级地点">
                <el-input v-model="classes.context" placeholder="班级地点"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="search">查询</el-button>
            </el-form-item>
        </el-form>
        <el-table :data="data.list" stripe style="width: 100%">
            <el-table-column type="index"></el-table-column>
            <el-table-column prop="subject" label="班级科目"></el-table-column>
            <el-table-column prop="context" label="班级简介"></el-table-column>
            <el-table-column prop="sumary" label="创建日期"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="danger" @click="deleteClasses(scope.row.id)">删除</el-button>
                    <router-link class="btn btn-default" :to="{ name :'editClasses', params: { id: scope.row.id }}">编辑</router-link>                   
                </template>
            </el-table-column>
        </el-table>
        <div class="block">
            <el-pagination
                layout="total,prev, pager, next"
                :current-page="data.pageInfo.pageNum"
                :page-size="6"
                :total="data.pageInfo.total"
                @current-change="nextPage">
            </el-pagination>
        </div>
    </div>
</template>
<script>
    import { mapGetters } from 'vuex'

    import page from '../../common/page'

    export default {
        data() {
            return {
                classes : {
                    subject: '',
                    context: ''
                }
            }
        },
        computed: mapGetters({
            data: 'getAdminClassesList'
        }),
        created() {
            this.$store.dispatch('fetchAdminClassesList', {data: {}, pageInfo: {pageNum: 1}})
        },
        methods: {
            deleteClasses(id) {
                console.log(id)
                var data = {id: id};
                this.$store.dispatch('deleteClasses', {data: data}).then((resp)=>{
                    this.$store.dispatch('fetchAdminClassesList', {data:{}, pageInfo: {pageNum: 1}})
                })
            },
            search() {
                this.$store.dispatch('searchClasses', {data: this.classes});
            },
            nextPage(page){
                this.data.pageInfo.pageNum = page;
                this.$store.dispatch('fetchAdminClassesList',{ data: {}, pageInfo: this.data.pageInfo })
            }
        },
        components: {
            'page': page
        }
    }
</script>
