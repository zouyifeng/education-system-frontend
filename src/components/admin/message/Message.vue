<template>
    <el-col :span="23" :offset="1">
        <el-tabs v-model="activeName" class="mt-15">
            <el-tab-pane label="留言管理" name="first">
                <el-form :inline="true" v-model="message.search" class="mt-15" style="width: 100%">
                    <el-form-item label="留言状态">
                        <el-radio-group v-model="message.search.status">
                            <el-radio :label="null">全部</el-radio>            
                            <el-radio :label="1">已回复</el-radio>
                            <el-radio :label="0">未回复</el-radio>
                        </el-radio-group>
                    </el-form-item>
                </el-form>
                <el-table :data="message.data.list" stripe style="width: 100%">
                    <el-table-column type="index" label="序号" width="80px"></el-table-column>
                    <el-table-column prop="question" label="问题"></el-table-column>
                    <el-table-column prop="reply" label="回答"></el-table-column>
                    <el-table-column prop="createTime" label="提问时间"></el-table-column>
                    <el-table-column prop="replyTime" label="回答时间"></el-table-column>
                    <el-table-column label="操作">
                        <template scope="scope">
                            <el-button size="small" type="danger" @click="deleteMessage(scope.row.id)">删除</el-button>
                            <el-button size="small" @click="message.dialogFormVisible=true;message.selectedMessage=scope.row.id" :disabled="!!scope.row.reply">回复</el-button>
                        </template>
                    </el-table-column>
                </el-table>
                <el-dialog title="回复消息" v-model="message.dialogFormVisible">
                    <el-form >
                        <el-form-item label="输入内容" >
                            <el-input v-model="message.reply" auto-complete="off"></el-input>
                        </el-form-item>
                    </el-form>
                    <div slot="footer" class="dialog-footer">
                        <el-button @click="message.dialogFormVisible = false">取 消</el-button>
                        <el-button type="primary" @click="message.dialogFormVisible=false;replyMessage()">确 定</el-button>
                    </div>
                </el-dialog>
                <div class="pull-right block mt-15">
                    <el-pagination
                        layout="total,prev, pager, next"
                        :current-page="message.data.pageInfo.pageNum"
                        :page-size="message.data.pageInfo.pageSize"
                        :total="message.data.pageInfo.total"
                        @current-change="nextPage(message);message.data.pageInfo.pageNum=arguments[0]">
                    </el-pagination>
                </div>
            </el-tab-pane>
            <el-tab-pane label="预报名" name="second">
                <el-form :inline="true" v-model="apply.search" class="mt-15" style="width: 100%">
                    <el-form-item label="预报名状态">
                        <el-radio-group v-model="apply.search.status">
                            <el-radio :label="null">全部</el-radio>            
                            <el-radio :label="1">已回复</el-radio>
                            <el-radio :label="0">未回复</el-radio>
                        </el-radio-group>
                    </el-form-item>
                </el-form>
                <el-table :data="apply.data.list" stripe style="width: 100%">
                    <el-table-column type="index" label="序号" width="80px"></el-table-column>
                    <el-table-column prop="name" label="姓名"></el-table-column>
                    <el-table-column prop="course" label="期待课程"></el-table-column>
                    <el-table-column prop="courseTime" label="期待上课时间"></el-table-column>
                    <el-table-column prop="sex" label="性别"></el-table-column>
                    <el-table-column prop="message" label="简短留言"></el-table-column>
                    <el-table-column label="操作">
                        <template scope="scope">
                            <el-button size="small" type="danger" @click="deleteApply(scope.row.id)">删除</el-button>
                            <el-button size="small" @click="apply.dialogFormVisible=true;apply.selectedApply=scope.row.id" :disabled="!!scope.row.reply">回复</el-button>
                        </template>
                    </el-table-column>
                </el-table>
                <el-dialog title="回复消息" v-model="apply.dialogFormVisible">
                    <el-form >
                        <el-form-item label="输入内容" >
                            <el-input v-model="apply.reply" auto-complete="off"></el-input>
                        </el-form-item>
                    </el-form>
                    <div slot="footer" class="dialog-footer">
                        <el-button @click="apply.dialogFormVisible = false">取 消</el-button>
                        <el-button type="primary" @click="apply.dialogFormVisible=false;replyApply()">确 定</el-button>
                    </div>
                </el-dialog>
                <div class="pull-right block mt-15">
                    <el-pagination
                        layout="total,prev, pager, next"
                        :current-page="apply.data.pageInfo.pageNum"
                        :page-size="apply.data.pageInfo.pageSize"
                        :total="apply.data.pageInfo.total"
                        @current-change="nextPage;apply.data.pageInfo.pageNum=arguments[0]">
                    </el-pagination>
                </div>
            </el-tab-pane>
        </el-tabs>
    </el-col>
</template>
<script>
    import { mapGetters } from 'vuex'
    import * as Util from '../../../store/util'

    export default {
        data() {
            return {
                activeName: 'first',
                message: {
                    search: {
                        status: 2
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
                },
                apply: {
                    search: {
                        status: 2
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
            }
        },
        created() {
            this.fetchMessageList();
            this.fetchApplyList();
            this.$watch('message.search', function(){
                const url = '/admin/message_list.action';
                Util.post({ url }, {data: this.message.search, pageInfo: this.message.data.pageInfo}).then((resp) => {
                    this.message.data = resp.data.data;
                });
            },{
                deep: true
            });
            this.$watch('apply.search', function(){
                const url = '/admin/apply_list.action';
                Util.post({ url }, {data: this.apply.search, pageInfo: this.apply.data.pageInfo}).then((resp) => {
                    this.apply.data = resp.data.data;
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
            deleteApply(id) {
                const data = {id: id},
                      url = '/admin/apply_delete.action';
                Util.post({ url }, {data: data}).then((resp) => { 
                    this.$message({
                        message: '删除成功！'
                    });
                    this.fetchApplyList();
                });
            },
            fetchMessageList() {
                const url = '/admin/message_list.action';
                Util.post({ url }, {pageInfo: this.message.data.pageInfo}).then((resp) => {
                    this.message.data = resp.data.data;
                });
            },
            fetchApplyList() {
                const url = '/admin/apply_list.action';
                Util.post({ url }, {pageInfo: this.apply.data.pageInfo}).then((resp) => {
                    this.apply.data = resp.data.data;
                });
            },
            replyMessage()　{
                const url = '/admin/message_edit.action';
                var data = {
                    id: this.selectedMessage,
                    reply: this.message.reply
                }
                Util.post({ url }, {data: data}).then((resp) => {
                    this.$message({
                        message: '回复成功！'
                    });
                    this.fetchMessageList();
                });
            },
            replyApply()　{
                const url = '/admin/apply_edit.action';
                var data = {
                    id: this.apply.selectedApply,
                    reply: this.apply.reply
                }
                Util.post({ url }, {data: data}).then((resp) => {
                    this.$message({
                        message: '回复成功！'
                    });
                    this.fetchMessageList();
                });
            },
            nextPage(type) {
                if(type == 'message') {
                    this.fetchMessageList();
                }else if(type == 'apply'){
                    this.fetchApplyList();
                }
            }
        }
    }
</script>