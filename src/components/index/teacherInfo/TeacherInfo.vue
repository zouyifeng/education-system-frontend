<template>
    <div class="container">
        <el-row>
            <el-col :span="6" v-for="item in teacherList.list">
                <div class="card">
                    <el-card>
                        <img :src="item.face" class="image">
                        <div style="padding-top: 10px;">
                            <span>{{item.name}}</span>
                            <div class="bottom clearfix">
                            <span class="time">{{ item.introduction }}</span>
                            </div>
                        </div>
                    </el-card>
                </div>
            </el-col>
        </el-row>
    </div>
</template>
<style>                 
    .time {
        font-size: 13px;
        color: #999;
    }

    .card {
        margin: 15px;
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
    import * as Util from '../../../store/util'
    console.log(Util.urlPrefix)

    export default {
        data() {
            return {
                urlPrefix: Util.urlPrefix
            }
        },
        computed: mapGetters({
            teacherList: 'getTeacherList'
        }),
        created() {
            this.$store.dispatch('fetchTeacherList', {data: { type: 2 }})
        }
    }
</script>
