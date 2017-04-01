<template>
    <el-card class="box-card">
    <div slot="header" class="clearfix">
        <span style="line-height: 36px;">{{title}}</span>
    </div>
        <ul>
            <li v-for="(item, index) in data.list">
                <p>
                    {{item.title}} - {{item.date}} 
                    <router-link :to="{ name :'classActivityDetail', params: { id: item.id }}">详情</router-link>                                
                </p>
            </li>
        </ul>
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