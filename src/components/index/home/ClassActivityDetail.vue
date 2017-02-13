<template>
    <div class="container">
        <div class="page-header">
            <h1>Example page header <small>Subtext for header</small></h1>
        </div>
        <p>content content content content content</p>
    </div>
</template>
<script>
    export default {
        created () {
            console.log('template');
            console.log(this.$route.params.id)
            this.$store.dispatch('getClassActivityDetatil',{data: { id : this.$route.params.id }});
        }
    }
</script>