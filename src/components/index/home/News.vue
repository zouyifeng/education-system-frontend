<template>
    <div class="box mt-15">
        <div class="box-title primary-bg"><i class="el-icon-information mr-15"></i>{{title}}</div>
        <div class="box-content">
            <ul class="news-list">
                <li class="news-item" v-for="(item, index) in data.list">
                    <span class="news-title pull-left">[{{typeMap[item.type]}}] {{item.title}}</span>
                    <span class="pull-right">{{item.date}} <router-link :to="{ name :'classActivityDetail', params: { id: item.id }}">详情</router-link> </span>
                </li>
            </ul>
        </div>
    </div>
</template>
<style lang="scss">
    .news-list {
        color: #48576a;
        a {
            color: #8391a5;
        }
        a:hover {
            color: #1e88e5;
        }
        p {
            margin: 0;
        }
        .news-item {
            font-size: 15px;
            padding: 6px 10px;
            overflow: hidden;
        }
        .news-title {
            display: inline-block;
            width: 230px;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }
    }
</style>
<script>

    import { mapGetters } from 'vuex'

    export default {
        props:['title', 'type'],
        data() {
            return {
                typeMap: {
                    '1': '学务科',
                    '2': '教务科',
                    '3': '考务科',
                    '4': '学籍科'
                }
            }
        },
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