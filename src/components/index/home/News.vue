<template>
    <el-card class="box-card">
    <div slot="header" class="clearfix">
        <span style="line-height: 36px;">{{title}}</span>
    </div>
        <el-table :data="data.list" stripe style="width: 100%">
            <el-table-column prop="title" label="标题" width="180"></el-table-column>
            <el-table-column prop="date" label="时间" width="180"></el-table-column>
            <el-table-column>
                <template scope="scope">
                    <router-link :to="{ name :'classActivityDetail', params: { id: scope.row.id }}">详情</router-link>            
                </template>
            </el-table-column>
        </el-table>
    </el-card>
</template>
<script>

    import { mapGetters } from 'vuex'

    export default {
        props:['title', 'type'],
        mounted() {
            this.$store.dispatch('getNews',{data: {type: this.type}});
        },
        created() {
            console.log(this.title)
        },
        computed: mapGetters({
            data: 'getNews'
        }),
        methods: {
            nextPage(page) {
                this.data.pageInfo.pageNum = page;  //不规范
                this.$store.dispatch('getNewsByPage', { data: {type: this.type}})
            }
        }
    }

</script>