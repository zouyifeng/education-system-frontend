<template>
    <div>
        <el-form :inline="true" :model="search" class="demo-form-inline" style="width: 100%">
            <el-form-item label="标题">
                <el-input v-model="search.title" placeholder="标题"></el-input>
            </el-form-item>
            <el-form-item label="作者">
                <el-input v-model="search.author" placeholder="作者"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="searchNews">查询</el-button>
            </el-form-item>
        </el-form>
        <el-table :data="data.list" stripe style="width: 100%">
            <el-table-column type="index" label="序号"></el-table-column>
            <el-table-column prop="title" label="标题"></el-table-column>
            <el-table-column prop="author" label="作者"></el-table-column>
            <el-table-column prop="date" label="创建日期"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="danger" @click="deleteNews(scope.row.id)">删除</el-button>
                    <router-link class="btn btn-default" :to="{ name :'editNews', params: { id: scope.row.id }}">编辑</router-link>                   
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

    import page from '../../common/Page'

    // import { MessageBox } from 'element-ui'

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
                    this.$store.dispatch('fetchAdminNews', {data: {}, pageInfo: {pageNum: 1}});
                }, () => {
                    console.log('Delete news error!');
                });
            },
            edit(id) {
                var data = {id : id};
                // this.$router.push({path : 'editNews'});
            },
            searchNews() {
                this.$store.dispatch('searchNews', {data: this.search}).then((resp) => {
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
        },
        components: {
            // messageBox: messagebox 
            'page': page
        }
    }
</script>