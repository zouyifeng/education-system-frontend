<template>
    <div class="panel panel-default">
        <div class="panel-heading">新闻管理</div>
        <div class="panel-body">
            <form class="form-inline">
                <div class="form-group">
                    <label for="title">标题</label>
                    <input type="text" class="form-control" id="title" placeholder="标题" v-model="search.title">
                </div>
                <div class="form-group">
                    <label for="author">作者</label>
                    <input type="text" class="form-control" id="author" placeholder="作者" v-model="search.author">
                </div>
                <button type="button" class="btn btn-default" v-on:click="searchNews()">查询</button>
                <router-link to="/admin/editNews" class="btn btn-primary">新增</router-link>                    
            </form>
            <table class="table">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>标题</th>
                        <th>作者</th>
                        <th>来源</th>
                        <th>发布时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, index) in newsList.list">
                        <th scope="row">{{index + 1}}</th>
                        <td>{{item.title}}</td>
                        <td>{{item.author}}</td>
                        <td>{{item.source}}</td>
                        <td>{{item.date}}</td>
                        <td>
                            <button type="button" class="btn btn-xs btn-default" v-on:click="deleteNews(item.id)">删除</button>
                            <button type="button" class="btn btn-xs btn-default" v-on:click="edit(item.id)">编辑</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
<script>
    import { mapGetters } from 'vuex'

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
            newsList: 'getNews'
        }),
        created() {
            this.$store.dispatch('fetchAdminNews');
        },
        methods: {
            deleteNews(id) {
                var data = {id: id};
                this.$store.dispatch('deleteNews', {data: data}).then((resp) => {
                    this.$store.dispatch('getNews');
                }, () => {
                    console.log('Delete news error!');
                });
            },
            edit(id) {

            },
            searchNews() {
                this.$store.dispatch('searchNews', this.search).then((resp) => {
                    console.log(resp);
                }, () => {
                    console.log('Search news error!');                    
                });
            }
        },
        components: {
            // messageBox: messagebox 
        }
    }
</script>