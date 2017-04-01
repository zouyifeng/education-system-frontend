<template>
    <el-col :span="23" :offset="1">
        <el-form :inline="true" :model="search" class="mt-15" style="width: 100%">
            <el-form-item label="标题">
                <el-input v-model="search.title" placeholder="标题"></el-input>
            </el-form-item>
            <el-form-item label="作者">
                <el-input v-model="search.author" placeholder="作者"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="searchNews">查询</el-button>
            </el-form-item>
            <el-form-item>                
                <router-link :to="{ name :'addNews'}"><el-button>新增</el-button></router-link>                   
            </el-form-item>
        </el-form>
        <el-table :data="data.list" stripe style="width: 100%">
            <el-table-column type="index" label="序号" width="80px"></el-table-column>
            <el-table-column prop="title" label="标题"></el-table-column>
            <el-table-column prop="author" label="作者"></el-table-column>
            <el-table-column prop="date" label="创建日期"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <router-link class="btn btn-default" :to="{ name :'editNews', params: { id: scope.row.id }}"><el-button size="small">编辑</el-button></router-link>                    
                    <el-button size="small" type="danger" @click="deleteNews(scope.row.id)">删除</el-button>
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

    export default {
        data() {
            return {
                search: {
                    title: '',
                    author: ''
                }
            }
        },
        computed: mapGetters({
            data: 'getAdminNews'
        }),
        created() {
            this.$store.dispatch('fetchAdminNews', {data: {}, pageInfo: {pageNum: 1}});
        },
        methods: {
            deleteNews(id) {
                var data = {id: id};
                this.$store.dispatch('deleteNews', {data: data}).then((resp) => {
                    this.$notify.success({
                        title: '删除成功',
                        message: '你已经成功删除一条新闻 ！',
                        offset: 100
                    });
                    this.$store.dispatch('fetchAdminNews', {data: {}, pageInfo: {pageNum: 1}});
                },()=>{
                    this.$message({
                        message: '删除失败！',
                        message: '删除新闻失败 ！',
                        offset: 100,                        
                        type: 'error'
                    });
                });
            },
            edit(id) {
                var data = {id : id};
                // this.$router.push({path : 'editNews'});
            },
            searchNews() {
                this.$store.dispatch('searchNews', {data: this.search, pageInfo: {pageNum: 1}}).then((resp) => {
                    console.log(resp);

                    // this.$store.dispatch('getAdminNews');
                }, () => {
                    console.log('Search news error!');                    
                });
            },
            nextPage(page) {
                this.data.pageInfo.pageNum = page;  //不规范
                this.$store.dispatch('fetchAdminNews', { data: {}, pageInfo: this.data.pageInfo })
            }
        }
    }
</script>