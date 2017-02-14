<template>
    <div class="container">
        <div class="page-header">
            <h1>{{news.article.title}} <small>{{news.article.author}} / {{news.article.date}}</small></h1>
        </div>
        <p>{{news.article.context}}</p>
    </div>
</template>
<script>

    import { mapGetters } from 'vuex'

    export default {
        computed: mapGetters({
            news: 'getNewsDetail'
        }),
        created () {
            this.$store.dispatch('getNewsDetail', { id : this.$route.params.id });
        }
    }
    </script>