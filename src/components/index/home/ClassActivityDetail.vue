<template>
    <div class="container">
        <div class="page-header">
            <h1>{{classActivityDetailArticle.title}} <small>{{classActivityDetailArticle.author}} / {{classActivityDetailArticle.date}}</small></h1>
        </div>
        <p>{{classActivityDetailArticle.context}}</p>
    </div>
</template>
<script>

    import { mapGetters } from 'vuex'

    export default {
        computed: mapGetters({
            classActivityDetailArticle: 'getClassActivityDetailArticle'
        }),
        created () {
            this.$store.dispatch('getClassActivityDetatil', { id : this.$route.params.id });
        }
    }
    </script>