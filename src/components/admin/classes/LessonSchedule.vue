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
                <li v-for="(item, index) in day" v-text="item && item.name" v-bind:class="{ active : !!item&&item.name}"></li>
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
        display: block;
        width: 100%;
    }

    .active {
        background: #ffa360;
    }

</style>
<script>

    import * as Util from '../../../store/util'

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
        created() {
            const url = '/admin/lesson_list.action';
            Util.post( { url } , {data: { 
                classesId: this.$route.params.id,
                startTime: this.getWeek(new Date()).start,
                endTime: this.getWeek(new Date()).end
            }} ).then((resp) => { 

                this.creatSchedule(resp.data.data);
            })
        },
        methods: {
            getWeek(date) {
                var start = date.setDate(date.getDate() - date.getDay());
                var end = date.setDate(date.getDate() + 7);
                return {
                    start: start,
                    end: end
                }
            },
            creatSchedule(lessonList) {
                for(var i=0; i<7; i++){
                    var t = new Array(5);
                    this.schedule.push(t);
                }
                var that = this;
                lessonList.forEach(function(item, index){
                    var current = new Date(item.startTime),
                        beginTime = current.getHours();
                        console.log(beginTime)
                    switch(beginTime) {
                        case 8: 
                            that.schedule[current.getDay()-1][0] = item;
                            break;
                        case 10:
                            that.schedule[current.getDay()-1][1] = item;
                            break;
                        case 12:
                            that.schedule[current.getDay()-1][2] = item;
                            break;                            
                        case 14:
                            that.schedule[current.getDay()-1][3] = item;
                            break;                            
                        case 16:
                            that.schedule[current.getDay()-1][4] = item;
                            break;                            
                    }
                })
                console.log(that.schedule)
            }
        }
    }
</script>