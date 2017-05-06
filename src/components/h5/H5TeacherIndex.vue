<template>
    <el-tabs v-model="pageConfig.activeName">
        <el-tab-pane label="我的信息" name="first" class="info-index">
            <div class="avator-box">
                <img class="avator" :src="teacher.face" alt="">
                <h4 class="name">{{teacher.name}}</h4>
                <p>{{teacher.introduction}}</p>
            </div>
            <ul class="info">
                <li class="info-item">
                    <div class="info-key">专业</div>
                    <div class="info-value">{{teacher.majorName}}</div>
                </li>
                <li class="info-item">
                    <div class="info-key">邮箱</div>
                    <div class="info-value">{{teacher.email}}</div>
                </li>
                <li class="info-item">
                    <div class="info-key">电话</div>
                    <div class="info-value">{{teacher.telephone}}</div>
                </li>
                <li class="info-item">
                    <div class="info-key">我的班级</div>
                    <div class="info-value">
                        <el-tag type="success" v-for="item in teacher.classes">{{item.subject}}</el-tag>
                    </div>
                </li>
            </ul>
        </el-tab-pane>
        <el-tab-pane label="我的课表" name="second">
            <el-form>
                <el-form-item>
                    <el-select class="ml-15" v-model="selectedLessonId" placeholder="请选择班级">
                        <el-option
                            v-for="item in teacher.classes"
                            :label="item.subject"
                            :value="item.id">
                        </el-option>
                    </el-select>
                    <a v-bind:href="'#/h5teacherIndex/schedule/' + selectedLessonId"><el-button type="primary" size="normal" class="ml-15">確定</el-button></a>                   
                </el-form-item>
                <router-view></router-view>
            </el-form>
        </el-tab-pane>
    </el-tabs>
</template>
<style lang="scss">
    .info-index {
         height: 100%;
        .avator-box {
            padding-top: 80px;
            text-align: center;
        }
        .avator{
            width: 100px;
            height: 100px;
            border-radius: 50px;
            margin-bottom: 20px;
            text-align: center;
            overflow: hidden;
        }

        .info{
            padding: 15px 10px;
            .info-item {
                overflow: hidden;
                height: 60px;
            }
            .info-item + .info-item {
                border-top: 1px solid #ddd;
            }
            .info-key, .info-value {
                float: left;
                line-height: 60px;
            }

            .info-key{
                width: 90px;
                color: #666;
            }
        }
    }

</style>
<script>

    import * as Util from '../../store/util'

    export default {
        data() {
            return {
                pageConfig: {
                    activeName: 'first'
                },
                teacher: {},
                selectedLessonId: ''
            }
        },
        created() {
             const that = this;
             var queryId = '';

             if(Util.getQueryObj('teacherId') != null) {
                queryId = Util.getQueryObj('teacherId');
             } else if(this.$route.params.id) {
                queryId = this.$route.params.id;
             }
             
            this.$store.dispatch('fetchAdminTeacherDetail', {data: {id: queryId}}).then((resp)=>{
                that.teacher = resp.data.data;
            });
        }
    }
</script>