<template>
    <el-col :span="23" :offset="1">
        <el-form :inline="true" class="mt-15">
            <el-form-item label="新闻类型" label-width="80px">
                <el-select v-model="news.type" placeholder="请选择新闻类型">
                    <el-option label="交流成果" v-bind:value="2"></el-option>
                    <el-option label="学习成果" v-bind:value="3"></el-option>
                    <el-option label="通知公告" v-bind:value="4"></el-option>
                </el-select>
            </el-form-item> 
            <el-form-item label="标题">
                <el-input v-model="news.title"></el-input>
            </el-form-item>
            <el-form-item label="作者" >
                <el-input v-model="news.author"></el-input>
            </el-form-item>
            <el-form-item  label="来源">
                <el-input v-model="news.source"></el-input>
            </el-form-item>
        </el-form>
        <el-form label-width="80px">
            <el-form-item label="新闻纪录">
                <div id="editor"></div>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" v-on:click="submit">提交</el-button>   
            </el-form-item>
        </el-form>
    </el-col>
</template> 
<script>
    import $ from 'jquery'
    import 'wangeditor/dist/css/wangEditor.min.css'
    import wangeditor from 'wangeditor'

    import * as Util from '../../../store/util'

    export default {
        data() {
            return {
                news: {
                    'author': '',
                    'title': '',
                    'context': '',
                    'source': '',
                    'type':'',
                    'picUrl': []
                }
            }
        },
        created () {
            if(this.$route.params.id !== undefined){
                var data = { id : this.$route.params.id };
                this.$store.dispatch('getNewsDetail', {data: data}).then((resp)=>{
                    this.news = resp.data.data.news;
                    $(editor).html(this.news.context);
                });
            }
            
            const that = this;
            $(function(){
                var editor = new wangeditor('editor');
                editor.config.uploadImgUrl = Util.urlPrefix + '/admin/news_pic_upload.action';

                editor.config.uploadImgFileName = 'pic';

                editor.config.uploadImgFns.onload = function(result, xhr){
                    result = JSON.parse(result);
                    that.news.picUrl.push({path: result.data.picUrl})
                     editor.command(null, 'insertHtml', '<img src="' + result.data.picUrl + '" style="max-width:100%;"/>');
                }

                editor.create();
            })
        },
        methods: {
            submit () {
                this.news.context = $(editor).html();

                const that = this;
                this.$store.dispatch('editNews', {data: this.news}).then((resp) => {
                    // console.log(resp)
                    if(!this.$route.params.id){
                        this.$router.push({path : './news'});
                    }else{
                        this.$router.push({path : '../news'});
                    }

                    for(var i=0; i<that.news.picUrl.length;i++) {
                        that.news.picUrl[i].newsId = resp.body.data.newsId;
                        const url = '/admin/news_pic_add.action';
                        Util.post({ url }, {data: that.news.picUrl[i]});
                    }
                });
            }
        }
    }
</script>