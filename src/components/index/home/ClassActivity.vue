<template>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">班级动态</h3>
        </div>
        <div class="panel-body">
            <table class="table">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>来源</th>
                        <th>时间</th>
                        <th>标题</th>
                        <th>详情</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, index) in data.list">
                        <th scope="row">{{index}}</th>
                        <td>{{item.source}}</td>
                        <td>{{item.date}}</td>
                        <td>{{item.title}}</td>
                        <td><router-link :to="{ path :'/index/classActivityDetail', params: { id: item.id }}">详情</router-link></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
<script>
    import { mapGetters } from 'vuex'

    export default {

        mounted() {
            this.$store.dispatch('getClassActivityInfo');
        },
        computed: {
            ...mapGetters({
                data : 'classActivityInfo'
            })
        },
        methods: {
            
        }
    }
</script>