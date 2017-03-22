<template>
    <el-col :span="12" :offset="2">
        <h3>编辑新闻</h3><hr>
        <el-form :label-position="labelPosition" label-width="80px">
            <el-form-item label="标题">
                <el-input v-model="news.title"></el-input>
            </el-form-item>
            <el-form-item label="作者">
                <el-input v-model="news.author"></el-input>
            </el-form-item>
            <el-form-item label="来源"> 
                <el-input v-model="news.source"></el-input>
            </el-form-item>
            <el-form-item label="内容"> 
                <el-input type="textarea" v-model="news.context"></el-input>
            </el-form-item>             
            <el-form-item>
                <el-button type="primary" v-on:click="submit">提交</el-button>   
            </el-form-item>
        </el-form>
    </el-col>
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
                    this.$router.push({path : './news'});
                }, () => {
                    console.log('error')
                });
            }
        }
    }
</script>