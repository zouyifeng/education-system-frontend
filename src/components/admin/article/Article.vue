<template>
    <div class="panel panel-default">
        <div class="panel-heading">文章管理</div>
        <div class="panel-body">
            <form class="form-inline">
                <div class="form-group">
                    <label for="title">标题</label>
                    <input type="text" class="form-control" id="title" placeholder="标题">
                </div>
                <div class="form-group">
                    <label for="author">作者</label>
                    <input type="email" class="form-control" id="author" placeholder="作者">
                </div>
                <button type="submit" class="btn btn-default">查询</button>
                <router-link to="/admin/editArticle" class="btn btn-primary">新增</router-link>                    
            </form>
            <table class="table">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>标题</th>
                        <th>作者</th>
                        <th>发布时间</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(index, item) in articleList.list">
                        <th scope="row">{{index}}</th>
                        <td>{{item.title}}</td>
                        <td>{{item.author}}</td>
                        <td>{{item.date}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
<script>
    import { mapGetters } from 'vuex'
    export default {
        computed: mapGetters({
            articleList: 'getClassActivityDetailArticle'
        }),
        mounted() {
            this.$store.dispatch('getClassActivity');
        }
    }
</script>