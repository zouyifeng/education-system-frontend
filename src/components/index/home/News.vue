<template>
     <el-table :data="data.list" stripe style="width: 100%">
        <el-table-column type="index" label="序号" width="100"></el-table-column>
        <el-table-column prop="source" label="来源" width="180"></el-table-column>
        <el-table-column prop="date" label="时间" width="180"></el-table-column>
        <el-table-column prop="title" label="标题" width="180"></el-table-column>
        <el-table-column>
            <template scope="scope">
                <router-link :to="{ name :'classActivityDetail', params: { id: scope.row.id }}">详情</router-link>            
            </template>
        </el-table-column>
    </el-table>
</template>
<script>
    import { mapGetters } from 'vuex'
    import page from '../../common/Page'

    export default {
        mounted() {
            this.$store.dispatch('getNews');
        },
        computed: mapGetters({
            data: 'getNews'
        }),
        components: {
            'page': page
        },
        methods: {
            nextPage(page) {
                this.data.pageInfo.pageNum = page;  //不规范
                this.$store.dispatch('getNewsByPage', { data: {}, pageInfo: this.data.pageInfo })
            }
        }
    }

</script>