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
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(itemm, index) in list">
                        <th scope="row">{{index}}</th>
                        <td>{{item.source}}</td>
                        <td>{{item.date}}</td>
                        <td>{{item.title}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                list: [],
            }
        },
        created() {
            this.fetchData();
        },
        methods: {
            fetchData(){
                this.$store.dispatch('GET_CLASS_ACTIVITY_INFO');
            }
        }
    }
</script>