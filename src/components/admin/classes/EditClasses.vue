<template>
    <el-col :span="23" :offset="1">
        <el-tabs class="mt-15" v-model="pageConfig.activeName" type="card">
            <el-tab-pane label="基本资料" name="first">
                <el-col :span="16">
                    <el-form label-width="100px">
                        <el-form-item label="班级科目" :span="5">
                            <el-input v-model="classes.subject"></el-input>
                        </el-form-item>
                        <el-form-item label="班级简介" :span="5">
                            <el-input v-model="classes.sumary"></el-input>
                        </el-form-item>
                        <el-form-item label="当天开班">
                            <el-switch on-text="是" off-text="否" v-model="pageConfig.todayOpen" disabled="!!classes.id"></el-switch>
                        </el-form-item>
                        <el-form-item label="" v-if="!pageConfig.todayOpen" >                      
                            <el-date-picker type="date" placeholder="选择日期" v-model="classes.date" style="width: 100%;"></el-date-picker>
                        </el-form-item>
                        <el-form-item label="详细介绍"> 
                            <el-input type="textarea" v-model="classes.context"></el-input>
                        </el-form-item> 
                        <el-form-item>
                            <el-button type="primary" v-on:click="submit">提交</el-button>
                        </el-form-item>
                    </el-form>
                </el-col>
            </el-tab-pane>
            <el-tab-pane label="成员管理" name="second">       
                <classmember></classmember>
            </el-tab-pane>
            <el-tab-pane label="活动列表" name="third">
                <el-table
                    :data="activityList.list"
                    style="width: 100%">
                    <el-table-column type="expand">
                        <template scope="props">
                            <el-form inline class="demo-table-expand">
                                <el-form-item label="正文">
                                    <span v-html="props.row.context"></span>
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
            <el-tab-pane label="发布活动" name="forth">
                <el-form :inline="true" label-width="100px">
                    <el-form-item prop="activity.title" label="活动标题">
                        <el-input v-model="activity.title"></el-input>
                    </el-form-item>
                    <el-form-item prop="activity.author" label="活动作者">
                        <el-input v-model="activity.author"></el-input>
                    </el-form-item>
                </el-form>
                <el-form label-width="100px">
                    <el-form-item label="班级活动记录">
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
            <el-tab-pane label="课程管理" name="fifth">
                <el-col :span="16" >
                    <el-form ref="form" :model="lesson" label-width="80px">
                        <el-form-item label="课程名称">
                            <el-input v-model="lesson.name"></el-input>
                        </el-form-item>
                        <el-form-item label="上课安排">
                            <el-checkbox v-for="(item, index) in courseDate" :label="item.code" v-model="item.checked">{{item.label}}</el-checkbox>
                        </el-form-item>
                        <el-form-item label="课时数">
                            <el-input v-model="lesson.count"></el-input>
                        </el-form-item>
                        <el-form-item label="开始日期">
                            <el-date-picker
                                v-model="lesson.beginDate"
                                type="date"
                                placeholder="选择开始日期"
                                :picker-options="pickerOptions">
                            </el-date-picker>
                        </el-form-item>
                        <el-form-item label="上课时间">
                            <el-col :span="6">
                                <el-time-select
                                    placeholder="开始时间"
                                    v-model="lesson.startTime"
                                    :picker-options="{
                                        start: '08:00',
                                        step: '02:00',
                                        end: '21:00',
                                        format : 'HH:mm'
                                    }">
                                </el-time-select>
                            </el-col>
                            <el-col class="line" :span="4">-</el-col>
                            <el-col :span="6">
                                <el-time-select
                                    placeholder="结束时间"
                                    v-model="lesson.endTime"
                                    :picker-options="{
                                        start: '10:00',
                                        step: '02:00',
                                        end: '20:00',
                                        format : 'HH:mm'
                                    }">
                                </el-time-select>
                            </el-col>
                        </el-form-item>
                        <el-form-item label="上课内容">
                            <el-input type="textarea" v-model="lesson.content"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="assignLesson">立即排课</el-button>
                        </el-form-item>
                    </el-form>
                </el-col>
            </el-tab-pane>
            <el-tab-pane label="课程表" name="sixth">
                <lessonschedule></lessonschedule>
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
    import LessonSchedule from './LessonSchedule'
    import ClassMember from './ClassMember'

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
                    imgList: [],
                    type: 1
                },
                lessons: [],
                lesson: {
                    name: '',
                    content: '',
                    beginDate: '',
                    count: '',
                    type: [],
                    startTime: '',
                    endTime: ''
                },
                img: {
                    dialogVisible: false,
                    dialogImageUrl: ''
                },
                pickerOptions: {
                    disabledDate(time) {
                        return time.getTime() < Date.now() - 8.64e7;
                    }
                },
                courseDate:[
                    {label: '每周一',code: 1,checked: false},
                    {label: '每周二',code: 2,checked: false},
                    {label: '每周三',code: 3,checked: false},
                    {label: '每周四',code: 4,checked: false},
                    {label: '每周五',code: 5,checked: false},
                    {label: '每周六',code: 6,checked: false},
                    {label: '每周日',code: 0,checked: false}
                ]
            }
        },
        computed: mapGetters({
            activityList: 'getAdminNews'
        }),
        created () {
            if(this.$route.params.id !== undefined){
                var data = { id: this.$route.params.id };
                this.$store.dispatch('fetchClassesDetail', {data: data}).then((resp) => {
                    this.classes = resp.data.data;
                });
                this.$store.dispatch('searchNews', {data: {classesId: this.$route.params.id}, pageInfo: {pageNum: this.activityList.pageInfo.pageNum}});
            }
            var that = this;
            $(function(){
                var editor = new wangeditor('editor');
                setTimeout(function(){
                    editor.config.uploadParams = {
                        classId: that.classes.id
                    }
                },1000)

                editor.config.uploadImgUrl = Util.urlPrefix + '/admin/news_pic_upload.action';

                editor.config.uploadImgFileName = 'pic';

                editor.config.uploadImgFns.onload = function(result, xhr){
                    result = JSON.parse(result);
                    that.activity.imgList.push({path: result.data.picUrl});
                     editor.command(null, 'insertHtml', '<img src="'+ result.data.picUrl +'" style="max-width:100%;"/>');
                }

                editor.create();
            })
        },
        components: {
            'lessonschedule': LessonSchedule,
            'classmember': ClassMember
        },
        methods: {
            submit () {
                var actionType = this.classes.id ? 'editClasses' : 'addClasses',
                    actionTypeStr = this.classes.id ? '修改' : '新增',
                    that = this;
                this.$store.dispatch(actionType, {data: this.classes}).then((resp) => {
                    this.$router.push({path : './classes'});
                    this.$notify.success({
                        title: actionTypeStr + '成功',
                        message: resp.data.data.message,
                        offset: 100
                    });
                });
                
                if( !!this.classes.id ){
                    this.activity.context = $(editor).html();
                    this.activity.classesId = this.classes.id;
                    this.$store.dispatch('editNews', {data: this.activity}).then((resp) => {
                        // console.log(resp)
                        this.$router.push({path : './classes'});
                        for(var i=0; i<that.activity.imgList.length; i++ ){
                            that.activity.imgList[i].newsId = resp.body.data.newsId;
                            const url =  '/admin/news_pic_add.action';
                            Util.post( { url } ,{data: that.activity.imgList[i]}).then((resp)=>{

                            })
                        } 
                    });
                }
            },
            nextPage(page){
                this.activityList.pageInfo.pageNum = page;  //不规范
                this.$store.dispatch('fetchAdminNews', { data: {}, pageInfo: this.activityList.pageInfo })
            },
            assignLesson() {
                var hasCreated = 0,
                    theDate = this.lesson.beginDate;
                while(hasCreated < this.lesson.count) {
                    var weekDayCode = theDate.getDay(),
                        that = this;
                    this.courseDate.forEach(function(item, index){
                        if(item.checked && item.code == weekDayCode) {
                            var temp = {},
                                pDate = that.getTheDay(theDate, 0).toString();
                            temp.startTime = pDate + ' ' + that.lesson.startTime;
                            temp.endTime = pDate + ' ' + that.lesson.endTime;
                            temp.content = that.lesson.content;
                            temp.classesId = that.$route.params.id;
                            temp.name = that.lesson.name;
                            that.lessons.push(temp);
                            hasCreated++;
                        }
                    });
                    theDate = this.parseDate(this.getTheDay(theDate, 1));
                }
                const url = '/admin/add_lesson.action' ;
                const self = this;
                Util.post( { url } , {data: { lesson: this.lessons}} ).then((resp) => { 
                    // this.fetchMessageList();
                    // this.message.question = '';
                    this.$notify.success({
                        title: '新增成功',
                        message: '你已经成功新增课时 ！',
                        offset: 100
                    });
                    this.pageConfig.activeName = 'sixth';
                    this.$store.dispatch('fetchClassesLesson',{data: { 
                        classesId: self.$route.params.id,
                        startTime: self.getWeek(new Date()).start,
                        endTime: self.getWeek(new Date()).end
                    }})
                })
            },
            getWeek(date) {
                var start = date.setDate(date.getDate() - date.getDay());
                var end = date.setDate(date.getDate() + 7);
                return {
                    start: start,
                    end: end
                }
            },
            getTheDay(now, addDayCount) {
                if(now instanceof Date){
                    var dd = now;
                    dd.setDate(dd.getDate()+addDayCount);
                    var y = dd.getFullYear();
                    var m = dd.getMonth()+1;//获取当前月份的日期
                    var d = dd.getDate();
                    if((m+"").length===1){
                        m = "0".concat(m);
                    }
                    if((d+"").length===1){
                        d = "0".concat(d);
                    }
                    return y+"-"+m+"-"+d;
                }else{
                    throw new Error("param 'now' is not a Date!!");
                }
            },
            parseDate(dateStr) {
                console.log(typeof dateStr)
                if(dateStr){
                    var date = new Date();
                    var dateArr = dateStr.split('-');
                    if(dateArr&&dateArr.length===3){
                        try{
                            date.setFullYear(dateArr[0],dateArr[1]-1,dateArr[2]);
                        }catch(e){
                            throw e;
                        }
                    }else{
                        throw new Error("param 'dateStr' is not validate !!");
                    }
                    return date;
                }else{
                    throw new Error("param 'dateStr' is require !!");
                }
            }
        }
    }
</script>