<template>  
    <el-col :span="22" :offset="1">
        <el-form :inline="true" :model="classes" class="demo-form-inline mt-15">
            <el-form-item label="班级名称">
                <el-input v-model="classes.subject" placeholder="班级名称" ></el-input>
            </el-form-item>
            <el-form-item label="班级简介">
                <el-input v-model="classes.sumary" placeholder="班级简介"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="search">查询</el-button>
            </el-form-item>
            <el-form-item>
                <el-button @click="pageConfig.dialogFormVisible=true">新增</el-button>                   
            </el-form-item>
        </el-form>
        <el-table :data="data.list" v-loading.body="data.list.length == 0" stripe style="width: 100%">
            <el-table-column type="expand">
                <template scope="props">
                    <el-form label-position="left" inline class="demo-table-expand">
                        <el-form-item label="教师：">
                            <span v-for="(item, index) in props.row.students"> {{index}}-{{item.name}}</span>
                        </el-form-item>
                        <el-form-item label="学生：">
                            <span v-for="(item, index) in props.row.students"> {{index}}-{{item.name}}</span>
                        </el-form-item>
                    </el-form>
                </template>
            </el-table-column>
            <el-table-column type="index" width="80" label="序号"></el-table-column>
            <el-table-column prop="subject" width="100" label="班级名称"></el-table-column>
            <el-table-column prop="sumary" label="班级简介"></el-table-column>
            <el-table-column prop="date" label="创建日期"></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="danger" @click="deleteClasses(scope.row.id)">删除</el-button>
                    <router-link :to="{ name :'editClasses', params: { id: scope.row.id }}"><el-button size="small">编辑</el-button></router-link>                   
                </template>
            </el-table-column>
        </el-table>
        <div class="pull-right block">
            <el-pagination
                layout="total,prev, pager, next"
                :current-page="data.pageInfo.pageNum"
                :page-size="6"
                :total="data.pageInfo.total"
                @current-change="nextPage">
            </el-pagination>
        </div>
        <el-dialog title="新增班级" v-model="pageConfig.dialogFormVisible">
            <el-form label-width="100px">
                <el-form-item label="班级科目" :span="5">
                    <el-input v-model="newClasses.subject"></el-input>
                </el-form-item>
                <el-form-item label="班级简介" :span="5">
                    <el-input v-model="newClasses.sumary"></el-input>
                </el-form-item>
                <el-form-item label="当天开班">
                    <el-switch on-text="是" off-text="否" v-model="newClasses.todayOpen"></el-switch>
                </el-form-item>
                <el-form-item label="开班日期" v-if="!newClasses.todayOpen">                      
                    <el-date-picker type="date" placeholder="选择日期" v-model="newClasses.date" style="width: 100%;" formate="yyyy-MM-dd"></el-date-picker>
                </el-form-item> 
                <el-form-item label="详细介绍"> 
                    <el-input type="textarea" v-model="newClasses.context"></el-input>
                </el-form-item> 
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="pageConfig.dialogFormVisible = false">取 消</el-button>
                <el-popover
                    ref="popover5"
                    placement="top"
                    width="160"
                    v-model="pageConfig.confirmDeleteVisible">
                    <p>确定新增吗？</p>
                    <div style="text-align: right; margin: 0">
                        <el-button size="mini" type="text" @click="pageConfig.confirmDeleteVisible = false">取消</el-button>
                        <el-button type="primary" size="mini" @click="pageConfig.confirmDeleteVisible = false; pageConfig.dialogFormVisible = false; addClasses()">确定</el-button>
                    </div>
                </el-popover>
                <el-button type="primary" v-popover:popover5>新 增</el-button>
            </div>
        </el-dialog>
        
    </el-col>
</template>
<script>
    import { mapGetters } from 'vuex'

    export default {
        data() {
            return {
                classes : {
                    subject: '',
                    context: ''
                },
                pageConfig: {
                    dialogFormVisible: false,
                    confirmDeleteVisible: false
                },
                newClasses: {
                    todayOpen: false,
                    subject: '',
                    sumary: '',
                    date: '',
                    context: ''
                }

            }
        },
        computed: mapGetters({
            data: 'getAdminClassesList'
        }),
        created() {
            this.$store.dispatch('fetchAdminClassesList', {data: {}, pageInfo: {pageNum: 1}})
        },
        methods: {
            deleteClasses(id) {
                var data = {id: id};
                this.$store.dispatch('deleteClasses', {data: data}).then((resp)=>{
                    this.$notify.success({
                        title: '删除成功',
                        message: '你已经成功删除班级 ！',
                        offset: 100
                    });
                    this.$store.dispatch('fetchAdminClassesList', {data:{}, pageInfo: {pageNum: 1}})
                },()=>{
                    this.$notify.error({
                        title: '删除失败',
                        message: '删除班级失败 ！',
                        offset: 100
                    });
                })
            },
            search() {
                this.$store.dispatch('searchClasses', {data: this.classes});
            },
            nextPage(page) {
                this.data.pageInfo.pageNum = page;
                this.$store.dispatch('fetchAdminClassesList',{ data: {}, pageInfo: this.data.pageInfo })
            },
            addClasses() {
                console.log(typeof this.newClasses.date)
                var t = this.newClasses.date;
                if(t != ''){
                    this.newClasses.date = t.getFullYear() + '-' + t.getMonth() + '-' + t.getMonth();
                }
                console.log(this.newClasses.date)
                this.$store.dispatch('addClasses', {data: this.newClasses}).then((resp) => {
                    this.$router.push({path : './classes'});
                });
            }
        }
    }
</script>
