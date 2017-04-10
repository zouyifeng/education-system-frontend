<template>
    <div>
        <div class="news-header">校园动态</div>
        <div class="h5-news">
            <h2>{{news.title}} </h2>
            <p class="news-info">作者：{{news.author}}&nbsp;&nbsp;&nbsp;  时间：{{news.date}}</p>
            <p class="news-context" v-html="news.context">{{news.context}}</p>
        </div>
    </div>
</template>
<style lang="scss">
    .h5-news {
        padding: 50px 10px;
    }
    .news-header {
        width: 100%;
        height: 45px;
        background-color: #324157;
        line-height: 45px;
        font-size: 15px;
        color: #fff;
        padding: 0 10px;
        position: fixed;
        z-index: 999;
    }
    .news-context {
        font-size: 14px;
    }
    .news-info {
        font-size: 15px;
        color: #999;
    }
</style>
<script>
import { mapGetters } from 'vuex'

export default {
    data() {
        return {
            news: {
                title: '',
                author: '',
                date: ''
            }
        }
    },
    created () {
        var data = { id : this.$route.params.id };
        var that = this;
        this.$store.dispatch('getNewsDetail', {data: data}).then((resp)=>{
            that.news = resp.data.data.news;
        });
    }
}
</script>