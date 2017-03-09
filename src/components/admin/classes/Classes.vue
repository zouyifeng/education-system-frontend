<template>
    <div class="panel panel-default">
        <div class="panel-heading">班级管理</div>
        <div class="panel-body">
            <form class="form-inline">
                <div class="form-group">
                    <label for="subject">科目</label>
                    <input type="text" class="form-control" id="subject" placeholder="科目" v-model="classes.subject">
                </div>
                <div class="form-group">
                    <label for="context">简介</label>
                    <input type="email" class="form-control" id="context" placeholder="班级地点" v-model="classes.context">
                </div>
                <button type="submit" class="btn btn-default" v-on:click="search">查询</button>
                <router-link to="/admin/editClasses" class="btn btn-primary">新增</router-link>                    
            </form>
            <table class="table">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>班级科目</th>
                        <th>班级简介</th>
                        <th>创建日期</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, index) in data.list">
                        <th scope="row">{{index + 1}}</th>
                        <td>{{item.subject}}</td>
                        <td>{{item.context}}</td>
                        <td>{{item.sumary}}</td>
                        <td>
                            <button type="button" class="btn btn-xs btn-default" v-on:click="deleteClasses(item.id)">删除</button>
                            <router-link class="btn btn-xs btn-default" :to="{ name :'editClasses', params: { id: item.id }}">编辑</router-link>
                        </td>
                    </tr>
                </tbody>
            </table>
            <page :cur="data.pageInfo.pageNum" :all="data.pageInfo.pages" :callback="nextPage"></page>
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
