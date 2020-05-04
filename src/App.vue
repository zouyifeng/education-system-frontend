<template>
    <div id="app">  
        <router-view></router-view>
    </div>
</template>
<script>
export default {
    created () {
        if (sessionStorage.getItem('lexue_store') ) {
            this.$store.replaceState(Object.assign({}, this.$store.state, JSON.parse(sessionStorage.getItem('lexue_store'))))
        } 

        //在页面刷新时将vuex里的信息保存到sessionStorage里
        window.addEventListener('beforeunload',() => {
            sessionStorage.setItem('lexue_store',JSON.stringify(this.$store.state))
        })
    }
}
</script>
