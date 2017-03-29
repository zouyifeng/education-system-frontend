<template>
    <el-row>
        <el-col :span="6" v-for="item in teacherList.list">
            <div class="card">
                <el-card>
                    <img :src="'api/picture/'+item.face" class="image">
                    <div style="padding-top: 10px;">
                        <span>{{item.name}}</span>
                        <div class="bottom clearfix">
                        <span class="time">{{ item.introduction }}</span>
                        <el-button type="text" class="button">查看更多</el-button>
                        </div>
                    </div>
                </el-card>
            </div>
        </el-col>
    </el-row>
</template>
<style>                 
    .time {
        font-size: 13px;
        color: #999;
    }

    .card {
        margin: 15px;
    }

    .button {
        padding: 0;
        float: right;
    }

    .image {
        width: 100%;
        display: block;
    }

    .clearfix:before,
    .clearfix:after {
        display: table;
        content: "";
    }

    .clearfix:after {
        clear: both
    }
</style>
<script>
    import { mapGetters } from 'vuex'

    export default {
        computed: mapGetters({
            teacherList: 'getTeacherList'
        }),
        created() {
            this.$store.dispatch('fetchTeacherList', {data: { type: 2 }})
        }
    }
</script>
