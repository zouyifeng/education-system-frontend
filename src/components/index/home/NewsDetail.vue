<template>
    <div class="container">
        <div class="page-header">
            <h2>{{news.title}} </h2>
            <h4>&nbsp;&nbsp;&nbsp;{{news.author}} / {{news.date}}</h4>
        </div>
        <p v-html="news.context">{{news.context}}</p>
    </div>
</template>
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