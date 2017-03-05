<template>
    <div class="container">
        <div class="page-header">
            <h1>{{news.title}} <small>{{news.author}} / {{news.date}}</small></h1>
        </div>
        <p>{{news.context}}</p>
    </div>
</template>
<script>

    import { mapGetters } from 'vuex'

    export default {
        // computed: mapGetters({
        //     news: 'getNewsDetail'
        // }),
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