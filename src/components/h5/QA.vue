<template>
    <div>
        <div class="qa-header">我要提问</div>
        <el-row class="qa"> 
            <el-form :inline="true">
                <el-form-item>
                    <el-input type="input" width="200px" v-model="message.question" placeholder="我的问题"></el-input>
                </el-form-item>
                <el-form-item class="pull-right">
                    <el-button v-on:click="ask" type="primary" >提问</el-button>
                </el-form-item>
            </el-form>
            <div v-for="item in messageList" >
                <p><el-tag type="danger">问题</el-tag>&nbsp;&nbsp; {{item.question}}</p>
                <p><el-tag type="success">回答</el-tag>&nbsp;&nbsp; <span v-html="item.reply? item.reply : '<span color=#666>管理员正在思考答案中......</span>'"></span></p><br>
            </div>
        </el-row>
        <el-dialog title="提示" v-model="dialogVisible" size="large">
            <span>您已成功提问，请耐心等候管理员回答！</span>
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
            </span>
        </el-dialog>
    </div>    
</template>
<style lang="scss">
    .qa-header {
        width: 100%;
        height: 45px;
        background-color: #f1b03f;
        line-height: 45px;
        font-size: 15px;
        color: #fff;
        padding: 0 10px;
        position: fixed;
        z-index: 999;
    }
    .qa {
        padding:55px 10px;
        font-size: 15px;
    }
    p {
        line-height: 1.8;
    }
    .contact-time {
        display: inline-block;
        float: right;
        font-size: 12px;
        color: #666;
    }
</style>
<script>
    import { mapGetters } from 'vuex'
    import * as Util from '../../store/util'

    export default{
        data() {
            return {
                message: {
                    question: ''
                },
                messageList: [],
                dialogVisible: false
            }
        },
        created() {
            this.fetchMessageList();
            document.title = '提问题';
        },
        methods: {
            ask(){
                const url = '/message_add.action' ;
                Util.post( {url} , {data: this.message} ).then((resp) => { 
                    this.fetchMessageList();
                    this.message.question = '';

                    this.dialogVisible = true;
                })
            },
            fetchMessageList() {
                const url = '/message_list.action' ;
                Util.post( {url} , {} ).then((resp) => {
                    console.log(resp.data.data)
                    this.messageList = resp.data.data;
                });
            }
        }
    }
</script>