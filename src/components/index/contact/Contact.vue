<template>
    <div class="container">
        <el-row :gutter="20"> 
            <el-col :span="8">
                <h2>联系我们</h2>
                <p><i class="el-icon-information"></i> 电话：888-888-8888</p>
                <p><i class="el-icon-information"></i> 邮箱：8888888888@qq.com</p>
                <p><i class="el-icon-information"></i> 传真：888-888-8888</p>
            </el-col>
            <el-col :span="14">
                <h2>我有问题</h2>
                <el-form :inline="true">
                    <el-form-item>
                        <el-input type="input" class="question" v-model="message.question" placeholder="我的问题"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button v-on:click="ask" type="primary">提问</el-button>
                    </el-form-item>
                </el-form>
                <div v-for="item in messageList" >
                    <p><el-tag type="danger">问题</el-tag>&nbsp;&nbsp; {{item.question}} <span class="contact-time">{{item.createTime}}</span></p>
                    <p><el-tag type="success">回答</el-tag>&nbsp;&nbsp; {{item.reply? item.reply : '管理员正在思考答案中......'}} <span class="contact-time">{{item.replyTime}}</span></p><br>
                </div>
            </el-col>
        </el-row>
    </div>
</template>
<style>
    .contact-time {
        display: inline-block;
        float: right;
        font-size: 12px;
        color: #666;
    }
    .question {
        min-width: 500px;
    }
</style>
<script>
    import { mapGetters } from 'vuex'
    import * as Util from '../../../store/util'

    export default{
        data() {
            return {
                message: {
                    question: ''
                },
                messageList: []
            }
        },
        created() {
            this.fetchMessageList();
        },
        methods: {
            ask(){
                const url = '/message_add.action' ;
                Util.post( {url} , {data: this.message} ).then((resp) => { 
                    this.fetchMessageList();
                    this.message.question = '';
                    this.$notify.success({
                        title: '提问成功',
                        message: '你已经成功提出一条问题 ！',
                        offset: 100
                    });
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