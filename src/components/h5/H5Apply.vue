<template>
    <div>
        <div class="apply-header">我要报名</div>
        <el-form class="apply" ref="form" :model="form" >
            <el-form-item label="姓名">
                <el-input v-model="form.name"></el-input>
            </el-form-item>
            <el-form-item label="简短留言">
                <el-input type="textarea" v-model="form.message"></el-input>
            </el-form-item>
            <el-form-item label="期望上课内容">
                <el-input type="text" v-model="form.course"></el-input>
            </el-form-item>
            <el-form-item label="性别">
                <el-radio-group v-model="form.sex">
                    <el-radio label="0">男</el-radio>
                    <el-radio label="1">女</el-radio>
                </el-radio-group>
            </el-form-item>
            <el-form-item label="期望上课时间">
                <el-col :span="11">
                    <el-date-picker type="date" placeholder="选择日期" v-model="form.courseTime" style="width: 100%;"></el-date-picker>
                </el-col>
            </el-form-item>
            <el-form-item label="联系方式">
                <el-input type="number" v-model="form.telephone"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="onSubmit">确定</el-button>
            </el-form-item>
            <el-dialog title="提交成功" v-model="dialogVisible" size="large">
                <span>你的预报名信息提交成功，管理员将会很快与您联系！</span>
                <span slot="footer" class="dialog-footer">
                    <el-button @click="dialogVisible = false">取 消</el-button>
                    <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
                </span>
            </el-dialog>
        </el-form>
    </div>
</template>
<style style="scss">
    .apply{
        width: 94%;
        margin: 0 auto;
        padding-top: 55px;
    }
    .apply-header {
        width: 100%;
        height: 45px;
        background-color: #37d2ac;
        line-height: 45px;
        font-size: 15px;
        color: #fff;
        padding: 0 10px;
        position: fixed;
        z-index: 999;
    }
</style>
<script>

    import * as Util from '../../store/util'

    export default {
        data() {
            return {
                form: {
                    sex: 0
                },
                dialogVisible: false
            }
        },
        methods: {
            onSubmit() {

                var t = this.form.courseTime;
                if(t != ''){
                    this.form.courseTime = t.getFullYear() + '-' + t.getMonth() + '-' + t.getMonth();
                }
                this.form.creator = Util.getQueryObj('apply');
                const url = '/apply_add.action' ;
                Util.post( {url} , {data: this.form} ).then((resp) => { 
                    this.dialogVisible = true;
                })
            }
        }
    }
</script>