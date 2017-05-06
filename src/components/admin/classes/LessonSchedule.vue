<template>
    <el-col :span="22" offset="1" class="mt-15">
        <div class="schedule mb-15">
            <ul class="week">
                <li v-for="(item, index) in weekDayCode">{{item.name}}</li>
            </ul>
            <ul class="week-item">
                <li v-for="(item, index) in timeRange" v-text="item.text"></li>
            </ul>
            <ul class="week-item" v-for="(day, index) in schedule">
                <li v-for="(item, index) in day" v-bind:class="{ active : !!item&&item.name}">
                    {{item && item.name}}<i v-if="!!item&&item.name" class="el-icon-close close-btn" v-on:click="deleteLesson(item.id)"></i>
                </li>
            </ul>
        </div>
    </el-col>
</template>
<style>
    .schedule {
        border-radius: 4px;
        border-top: 1px solid #ddd;
        border-left: 1px solid #ddd;
        overflow: hidden;
    }

    .schedule li {
        width: 12.5%;
        height: 80px;
        line-height: 80px;        
        border-bottom: 1px solid #ddd;        
        border-right: 1px solid #ddd;
        vertical-align: middle;
        text-align: center;
        box-sizing: border-box;
    }

    .week {
        overflow: hidden;
    }

    .schedule .week li {
        float: left;
    }

    .week-item {
        float: left;
        width: 12.5%;
        overflow: hidden;
    }

    .schedule .week-item li {
        position: relative;
        width: 100%;
        display: block;
    }

    .close-btn {
        position: absolute;
        top: 2px;
        right: 1px;
        color: #fff;
        transform: scale(0.7);
        cursor: pointer;
    }

    .close-btn:hover {
        color:aqua;
    }

    .active {
        background: #ffa360;
    }

</style>
<script>

    import * as Util from '../../../store/util';

    import { mapGetters } from 'vuex';

    export default {
        data() {
            return {
                weekDayCode: [
                    {name: '上课时间', code: -1},
                    {name: '周日', code: 0},
                    {name: '周一', code: 1},
                    {name: '周二', code: 2},
                    {name: '周三', code: 3},
                    {name: '周四', code: 4},
                    {name: '周五', code: 5},
                    {name: '周六', code: 6}
                ],
                timeRange: [
                    {text:  '8:00-10:00', code:1},
                    {text: '10:00-12:00', code:2},
                    {text: '14:00-16:00', code:3},
                    {text: '16:00-18:00', code:4},
                    {text: '18:00-20:00', code:5}
                ],
                schedule: []
            }
        },

        created () {
            this.fetchLesson();
        },
        watch: {
            scheduleData: function() {
                this.creatSchedule(this.scheduleData);
            }
        },
        computed: mapGetters({
            scheduleData: 'getClassesSchedule'
        }),
        methods: {
            fetchLesson() {
                const url = '/lesson_list.action';

                this.$store.dispatch('fetchClassesLesson',{data: { 
                    classesId: this.$route.params.id,
                    startTime: this.getWeek(new Date()).start,
                    endTime: this.getWeek(new Date()).end
                }} )

                // this.creatSchedule(this.schedule);
                
            },
            getWeek(date) {
                var start = date.setDate(date.getDate() - date.getDay());
                var end = date.setDate(date.getDate() + 7);
                return {
                    start: start,
                    end: end
                }
            },
            creatSchedule(lessonList) {
                this.schedule = [];
                for(var i=0; i<7; i++){
                    var t = new Array(5);
                    this.schedule.push(t);
                }
                var that = this;
                lessonList.forEach(function(item, index){
                    var current = new Date(item.startTime.replace(/-/g, '/')),
                        beginTime = current.getHours();
                    switch(beginTime) {
                        case 8: 
                            that.schedule[current.getDay()][0] = item;
                            break;
                        case 10:
                            that.schedule[current.getDay()][1] = item;
                            break;
                        case 12:
                            that.schedule[current.getDay()][2] = item;
                            break;                            
                        case 14:
                            that.schedule[current.getDay()][3] = item;
                            break;                            
                        case 16:
                            that.schedule[current.getDay()][4] = item;
                            break;                            
                    }
                })
            },
            deleteLesson(id) {
                const url = '/admin/delete_lesson.action',
                    that = this;
                Util.post( { url } , {data: { 
                    id: id
                }} ).then((resp) => { 
                    that.fetchLesson();
                })
            }
        }
    }
</script>