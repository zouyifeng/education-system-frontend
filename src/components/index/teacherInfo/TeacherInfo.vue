<template>
    <div class="container">
        <el-row>
            <el-col :span="6" v-for="item in teacherList.list">
                <div class="card">
                    <el-card>
                        <img :src="item.face" class="image">
                        <div class="mt-15">
                            <span>{{item.name}}</span>
                            <div class="bottom clearfix">
                            <div class="intro">{{ item.introduction }}</div>
                            </div>
                        </div>
                    </el-card>
                </div>
            </el-col>
        </el-row>
    </div>
</template>
<style>                 
    .intro {
        font-size: 13px;
        line-height: 1.4;
        color: #999;
        min-height: 38px;
    }

    .card {
        margin: 10px;
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
