<template>
    <el-col :span="14" :offset="2">
        <el-tabs class="mt-15" v-model="pageConfig.activeName" type="card">
            <el-tab-pane label="班级修改" name="first">
                <el-form label-width="100px">
                    <el-form-item label="班级科目" :span="5">
                        <el-input v-model="classes.subject"></el-input>
                    </el-form-item>
                    <el-form-item label="班级简介" :span="5">
                        <el-input v-model="classes.sumary"></el-input>
                    </el-form-item>
                    <el-form-item label="当天开班">
                        <el-switch on-text="是" off-text="否" v-model="pageConfig.todayOpen"></el-switch>
                    </el-form-item>
                    <el-form-item label="开班日期" v-if="!pageConfig.todayOpen">                      
                        <el-date-picker type="date" placeholder="选择日期" v-model="classes.date" style="width: 100%;"></el-date-picker>
                    </el-form-item>
                    <el-form-item label="详细介绍"> 
                        <el-input type="textarea" v-model="classes.context"></el-input>
                    </el-form-item> 
                    <el-form-item prop="activity.title" label="活动标题" v-if="!!this.$route.params.id">
                        <el-input v-model="activity.title"></el-input>
                    </el-form-item>
                    <el-form-item prop="activity.author" label="活动作者" v-if="!!this.$route.params.id">
                        <el-input v-model="activity.author"></el-input>
                    </el-form-item>
                    <el-form-item v-if="!!this.$route.params.id" label="班级活动记录">
                        <div id="editor"></div>
                    </el-form-item>
                    <el-dialog v-model="img.dialogVisible" size="tiny">
                        <img width="100%" :src="img.dialogImageUrl" alt="">
                    </el-dialog>
                    <el-form-item>
                        <el-button type="primary" v-on:click="submit">提交</el-button>
                    </el-form-item>
                </el-form>
            </el-tab-pane>
            <el-tab-pane label="活动列表" name="second">
                <el-table
                    :data="activityList.list"
                    style="width: 100%">
                    <el-table-column type="expand">
                    <template scope="props">
                        <el-form label-position="left" inline class="demo-table-expand">
                        <el-form-item label="正文">
                            <span>{{ props.row.context }}</span>
                        </el-form-item>
                        </el-form>
                    </template>
                    </el-table-column>
                    <el-table-column type="index" label="序号" width="80px"></el-table-column>
                    <el-table-column prop="title" label="标题"></el-table-column>
                    <el-table-column prop="author" label="作者"></el-table-column>
                    <el-table-column prop="date" label="创建日期"></el-table-column>
                    <el-table-column label="操作">
                        <template scope="scope">
                            <el-button size="small" type="danger" @click="deleteNews(scope.row.id)">删除</el-button>
                        </template>
                    </el-table-column>
                </el-table>
                <div class="pull-right block">
                    <el-pagination
                        layout="total,prev, pager, next"
                        :current-page="activityList.pageInfo.pageNum"
                        :page-size="6"
                        :total="activityList.pageInfo.total"
                        @current-change="nextPage">
                    </el-pagination>
                </div>
            </el-tab-pane>
        </el-tabs>

    </el-col>
</template> 
<script>

    import $ from 'jquery'
    import 'wangeditor/dist/css/wangEditor.min.css'
    import wangeditor from 'wangeditor'

    import { mapGetters } from 'vuex'
    import * as Util from '../../../store/util'



    export default {
        data() {
            return {
                classes: {
                    id: '',
                    subject: '',
                    sumary: '',
                    context: '',
                    description: '',
                    date:''
                },
                pageConfig: {
                    activeName:　'first',
                    todayOpen: false
                },
                activity: {
                    description: '',
                    title: '',
                    author: '',
                    source: '班级',
                    imgList: []
                },
                img: {
                    dialogVisible: false,
                    dialogImageUrl: ''
                }
            }
        },
        computed: mapGetters({
            activityList: 'getAdminNews'
        }),
        created () {
            if(this.$route.params.id !== undefined){
                var data = { id : this.$route.params.id };
                this.$store.dispatch('fetchClassesDetail', {data: data}).then((resp) => {
                    this.classes = resp.data.data;
                });
                this.$store.dispatch('searchNews', {data: {classesId: this.$route.params.id}, pageInfo: {pageNum: this.activityList.pageInfo.pageNum}});
            }
            var that = this;
            $(function(){
                var editor = new wangeditor('editor');
                setTimeout(function(){
                    console.log(that.classes.id)
                    editor.config.uploadParams  = {
                        classId: that.classes.id
                    }

                },1000)

                editor.config.uploadImgUrl = Util.urlPrefix + '/admin/news_pic_upload.action';

                editor.config.uploadImgFileName = 'pic';

                editor.config.uploadImgFns.onload = function(result, xhr){
                    result = JSON.parse(result);
                    // this.activity.imgList.push(result.data.picUrl);
                     editor.command(null, 'insertHtml', '<img :src="'+ Util.urlPrefix +'/resources/' + result.data.picUrl +'" style="max-width:100%;"/>');
                }

                editor.create();
            })
        },
        methods: {
            submit () {

                var actionType = this.classes.id ? 'editClasses' : 'addClasses'; 
                this.$store.dispatch(actionType, {data: this.classes}).then((resp) => {
                    // console.log(resp)
                    this.$router.push({path : './classes'});
                });
                
                if( !!this.classes.id ){
                    this.activity.context = $(editor).html();
                    this.activity.classesId = this.classes.id;
                    this.$store.dispatch('editNews', {data: this.activity}).then((resp) => {
                        // console.log(resp)
                        this.$router.push({path : './classes'});
                    });
                }
            },
            nextPage(page) {
                this.activityList.pageInfo.pageNum = page;  //不规范
                this.$store.dispatch('fetchAdminNews', { data: {}, pageInfo: this.activityList.pageInfo })
            }
        }
    }
</script>