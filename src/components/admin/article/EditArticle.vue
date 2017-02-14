<template>
    <div class="panel panel-default">
        <div class="panel-heading">新增文章</div>
        <div class="panel-body">
            <form>
                <div class="form-group">
                    <label for="title">标题</label>
                    <input id="title" type="text" class="form-control" placeholder="标题" v-model="article.title">
                </div>
                <div class="form-group">
                    <label for="author">作者</label>
                    <input id="author" type="text" class="form-control" placeholder="作者" v-model="article.author">
                </div>
                <div class="form-group">
                    <label for="author">来源</label>
                    <input id="author" type="text" class="form-control" placeholder="来源" v-model="article.source">
                </div>
                <div class="form-group">
                    <label for="content">内容</label>
                    <textarea id="content" type="text" class="form-control" placeholder="内容" v-model="article.context"></textarea>
                </div>
                <button type="submit" class="btn btn-default" v-on:click="submit">提交</button>
            </form>
        </div>
    </div>
</template> 
<script>
    export default {
        data() {
            return {
                article: {
                    'author': '',
                    'title': '',
                    'context': '',
                    'source': ''
                }
            }
        },
        methods: {
            submit () {
                console.log('submit')
                this.$store.dispatch('editArticle', this.article);
            }
        }
    }
</script>