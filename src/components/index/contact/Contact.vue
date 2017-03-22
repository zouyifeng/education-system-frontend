<template>
    <div class="container">
        <h1>联系我们</h1>
        <p><i class="el-icon-information"></i> 电话：888-888-8888</p>
        <p><i class="el-icon-information"></i> 邮箱：8888888888@qq.com</p>
        <p><i class="el-icon-information"></i> 传真：888-888-8888</p>
        <hr>
        <div>

            <el-input type="text-area" v-model="message.question"></el-input>
            <el-button v-on:click="ask">提问</el-button>

            <el-card class="box-card">
                <div v-for="item in messageList" >
                    <h5>问题 - 提问于{{item.createTime}}</h5>
                    <span>{{item.question}}</span>
                    <h5>回答 - 回答于{{item.replyTime}}</h5>
                    <span>{{item.reply}}</span>
                </div>
            </el-card>
            
        </div>
    </div>
</template>
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
                const url = '/api/message_add.action' ;
                Util.post( {url} , {data: this.message} ).then((resp) => { 
                    this.fetchMessageList();
                })
            },
            fetchMessageList() {
                const url = '/api/message_list.action' ;
                Util.post( {url} , {} ).then((resp) => {
                    console.log(resp.data.data)
                    this.messageList = resp.data.data;
                });
            }
        }
    }
</script>