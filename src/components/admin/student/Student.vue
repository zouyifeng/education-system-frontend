<template>
    <div class="panel panel-default">
        <div class="panel-heading">成员管理</div>
        <div class="panel-body">
            <form class="form-inline">
                <div class="form-group">
                    <label for="title">姓名</label>
                    <input type="text" class="form-control" id="name" placeholder="姓名" v-model="search.name">
                </div>
                <div class="form-group">
                    <label for="direction">研究方向</label>
                    <input type="email" class="form-control" id="direction" placeholder="研究方向" v-model="search.direction">
                </div>
                <button type="submit" class="btn btn-default" v-on:click="searchStudent">查询</button>
                <router-link to="/admin/editStudent" class="btn btn-primary">新增</router-link>                    
            </form>
            <table class="table">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>姓名</th>
                        <th>邮箱</th>
                        <th>电话</th>
                        <th>研究方向</th>
                        <th>文本</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, index) in data.list">
                        <th scope="row">{{index + 1}}</th>
                        <td>{{item.name}}</td>
                        <td>{{item.email}}</td>
                        <td>{{item.telephone}}</td>
                        <td>{{item.direction}}</td>
                        <td>{{item.introduction}}</td>
                        <td>
                            <button type="button" class="btn btn-xs btn-default" v-on:click="deleteStudent(item.id)">删除</button>
                            <router-link class="btn btn-xs btn-default" :to="{ name :'editStudent', params: { id: item.id }}">编辑</router-link>
                            <!-- <button type="button" class="btn btn-xs btn-default" v-on:click="edit(item.id)">编辑</button> -->
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
            return{
                search: {  
                    name: '',
                    direction: ''
                } 
            }
        },
        computed: mapGetters({
            data: 'getAdminStudentList'
        }),
        created() {
            this.$store.dispatch('fetchAdminStudentList', {data: {type: 1}, pageInfo: {pageNum: 1}})
        },
        methods: {
            deleteStudent(id) {
                var data = {id: id};
                this.$store.dispatch('deleteStudent', {data: data}).then((resp)=>{
                    this.$store.dispatch('fetchAdminStudentList', {data:{type: 1}, pageInfo: {pageNum: 1}})
                })
            },
            editStudent(id) {

            },
            searchStudent() {
                this.$store.dispatch('searchStudent', {data: this.search});
            },
            nextPage(page){
                this.data.pageInfo.pageNum = page;
                this.$store.dispatch('fetchAdminStudentList',{ data: {type: 1}, pageInfo: this.data.pageInfo })
            }
        },
        components: {
            'page': page
        }
    }

</script>