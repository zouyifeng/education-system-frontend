<template>
    <el-col :span="22" :offset="1">
        <el-form :inline="true" :model="search" class="mt-15" style="width: 100%">
            <el-form-item label="关键字搜索">
                <el-input v-model="search.context" placeholder="关键字"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="searchNews">查询</el-button>
            </el-form-item>
        </el-form>
        <el-table
            :data="data.list"
            style="width: 100%">
            <el-table-column type="expand">
            <template scope="props">
                <el-form label-position="left" inline class="demo-table-expand">
                <el-form-item label="正文">
                    <span>{{ props.row.context }}</span>
                </el-form-item>
                </el-form>
            </template>
            </el-table-column>
            <el-table-column type="index" label="序号" width="80px"></el-table-column>
            <el-table-column prop="title" label="标题"></el-table-column>
            <el-table-column prop="author" label="作者"></el-table-column>
            <el-table-column prop="date" label="创建日期"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
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
                    context: ''
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
                    this.$message({
                        message: '删除成功！'
                    });
                    this.$store.dispatch('fetchAdminNews', {data: {}, pageInfo: {pageNum: 1}});
                },()=>{
                    this.$message({
                        message: '删除失败！',
                        type: 'error'
                    });
                });
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
        }
    }
</script>