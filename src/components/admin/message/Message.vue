<template>
    <el-col :span="23" :offset="1">
        <el-form :inline="true" :model="search" class="mt-15" style="width: 100%">
            <el-form-item label="留言状态">
                <el-radio-group v-model="search.status">
                    <el-radio :label="2">全部</el-radio>            
                    <el-radio :label="1">已回复</el-radio>
                    <el-radio :label="0">未回复</el-radio>
                </el-radio-group>
            </el-form-item>
        </el-form>
        <el-table :data="data.list" stripe style="width: 100%">
            <el-table-column type="index" label="序号" width="80px"></el-table-column>
            <el-table-column prop="question" label="问题"></el-table-column>
            <el-table-column prop="reply" label="回答"></el-table-column>
            <el-table-column prop="createTime" label="提问时间"></el-table-column>
            <el-table-column prop="replyTime" label="回答时间"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="danger" @click="deleteMessage(scope.row.id)">删除</el-button>
                    <el-button size="small" @click="dialogFormVisible=true;selectedMessage=scope.row.id" :disabled="!!scope.row.reply">回复</el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-dialog title="回复消息" v-model="dialogFormVisible">
            <el-form >
                <el-form-item label="输入内容" >
                    <el-input v-model="reply" auto-complete="off"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="dialogFormVisible=false;replyMessage()">确 定</el-button>
            </div>
        </el-dialog>

        <div class="pull-right block">
            <el-pagination
                layout="total,prev, pager, next"
                :current-page="data.pageInfo.pageNum"
                :page-size="data.pageInfo.pagrSize"
                :total="data.pageInfo.total"
                @current-change="nextPage">
            </el-pagination>
        </div>
    </el-col>
</template>
<script>
    import { mapGetters } from 'vuex'
    import * as Util from '../../../store/util'

    export default {
        data() {
            return {
                search: {
                    status: 2,
                },
                data: {
                    list: [],
                    pageInfo: {
                        pageNum: 1
                    }
                },
                reply: '',
                dialogFormVisible: false,
                selectedMessage: ''
            }
        },
        created() {
            this.fetchMessageList();
            this.$watch('search', function(){
                const url = '/admin/message_list.action';
                Util.post({ url }, {data: this.search, pageInfo: this.data.pageInfo}).then((resp) => {
                    this.data = resp.data.data;
                });
            },{
                deep: true
            })
        },
        methods: {
            deleteMessage(id) {
                const data = {id: id},
                      url = '/admin/message_delete.action';
                Util.post({ url }, {data: data}).then((resp) => { 
                    this.$message({
                        message: '删除成功！'
                    });
                    this.fetchMessageList();
                });
            },
            fetchMessageList() {
                const url = '/admin/message_list.action';
                Util.post({ url }, {pageInfo: this.data.pageInfo}).then((resp) => {
                    this.data = resp.data.data;
                });
            },
            replyMessage()　{
                const url = '/admin/message_edit.action';
                var data = {
                    id: this.selectedMessage,
                    reply: this.reply
                }
                Util.post({ url }, {data: data}).then((resp) => {
                    this.$message({
                        message: '回复成功！'
                    });
                    this.fetchMessageList();
                });
            },
            nextPage(page) {
                this.data.pageInfo.pageNum = page;  //不规范
                this.fetchMessageList();
            }
        },
        // watch: {
        //     'search': {
        //          handler: function(){
        //             console.log('aaa')
        //             const url = Util.urlPrefix + '/admin/message_list.action';
        //             Util.post({ url }, {data: this.search, pageInfo: this.data.pageInfo}).then((resp) => {
        //                 this.data = resp.data.data;
        //             });
        //             return {
        //                 deep: true
        //             };
        //         }
        //     }
        // }
    }
</script>