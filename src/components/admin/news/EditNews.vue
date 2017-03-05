<template>
    <div class="panel panel-default">
        <div class="panel-heading">新增新闻</div>
        <div class="panel-body">
            <form>
                <div class="form-group">
                    <label for="title">标题</label>
                    <input id="title" type="text" class="form-control" placeholder="标题" v-model="news.title">
                </div>
                <div class="form-group">
                    <label for="author">作者</label>
                    <input id="author" type="text" class="form-control" placeholder="作者" v-model="news.author">
                </div>
                <div class="form-group">
                    <label for="author">来源</label>
                    <input id="author" type="text" class="form-control" placeholder="来源" v-model="news.source">
                </div>
                <div class="form-group">
                    <label for="content">内容</label>
                    <textarea id="content" type="text" class="form-control" placeholder="内容" v-model="news.context"></textarea>
                </div>
                <button type="button" class="btn btn-default" v-on:click="submit">提交</button>
            </form>
        </div>
    </div>
</template> 
<script>
    export default {
        data() {
            return {
                news: {
                    'author': '',
                    'title': '',
                    'context': '',
                    'source': ''
                }
            }
        },
        created () {
            if(this.$route.params.id !== undefined){
                var data = { id : this.$route.params.id };
                this.$store.dispatch('getNewsDetail', {data: data}).then((resp)=>{
                    this.news = resp.data.data.news;
                });
            }
        },
        methods: {
            submit () {
                this.$store.dispatch('editNews', {data: this.news}).then((resp) => {
                    // console.log(resp)
                    this.$router.push({path : '../news'});
                }, () => {
                    console.log('error')
                });
            }
        }
    }
</script>