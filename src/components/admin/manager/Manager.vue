<template>
    <el-col :span="23" :offset="1" class="mt-15">
        <el-button type="success" class="mb-15" @click="pageConfig.dialogFormVisible2 = true">新增用户</el-button>
        <el-table :data="adminList" stripe style="width: 100%">
            <el-table-column type="index" label="序号"  width="200px"></el-table-column>
            <el-table-column prop="username" label="用户名"></el-table-column>
            <el-table-column prop="type" label="用戶類型" inline-template><div>{{typeMap[row.type]}}</div></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="primary" @click="updatedAdmin = scope.row; pageConfig.dialogFormVisible1 = true;">修改账号</el-button>         
                    <el-button size="small" type="danger" @click="deleteAdmin(scope.row)">删除用户</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-dialog title="修改密码" v-model="pageConfig.dialogFormVisible1" size="small" @close="pageConfig.dialogFormVisible1 = false;">
            <el-form :model="updateAdmin">
                <el-form-item label="用户名" label-width="80px">
                    <el-input v-model="updatedAdmin.username"></el-input>
                </el-form-item>
                <el-form-item label="密码" label-width="80px">
                    <el-input type="password" v-model="updatedAdmin.password"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="pageConfig.dialogFormVisible1 = false">取 消</el-button>
                <el-button type="primary" @click="pageConfig.dialogFormVisible1 = false; updateAdmin()">确 定</el-button>
            </div>
        </el-dialog>
        <el-dialog title="新增用户" v-model="pageConfig.dialogFormVisible2" size="small" @close="pageConfig.dialogFormVisible2 = false;">
            <el-form :model="newAdmin">
                <el-form-item label="用户名" label-width="80px">
                    <el-input v-model="newAdmin.username"></el-input>
                </el-form-item>
                <el-form-item label="密码" label-width="80px">
                    <el-input type="password" v-model="newAdmin.password"></el-input>
                </el-form-item>
                <el-form-item label="类型选择">
                    <el-radio class="radio" v-model="newAdmin.type" label="1">学生</el-radio>
                    <el-radio class="radio" v-model="newAdmin.type" label="2">教师</el-radio>
                    <el-radio class="radio" v-model="newAdmin.type" label="3">管理员</el-radio>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="pageConfig.dialogFormVisible2 = false">取 消</el-button>
                <el-button type="primary" @click="pageConfig.dialogFormVisible2  = false; addAdmin()">确 定</el-button>
            </div>
        </el-dialog>
    </el-col>
</template>
<script>    
    import * as Util from '../../../store/util'

    export default {
        data() {
            return {
                newAdmin: {
                    username: '',
                    password: '',
                    type: null
                },
                typeMap: {
                    1: '学生',
                    2: '教师',
                    3: '管理员'
                },
                pageConfig: {
                    dialogFormVisible1: false,
                    dialogFormVisible2: false
                },
                updatedAdmin: {},
                adminList: []
            }
        },
        created() {
            this.fetchAllAdmin();
        },
        methods: {
            updateAdmin(admin) {
                const url = '/admin/update_admin.action',
                      that = this;
                Util.post( { url } , {data: this.updatedAdmin} ).then((resp) => { 
                    this.$notify.success({
                        title: '更新成功',
                        message: resp.data.data.message,
                        offset: 100
                    });
                    that.fetchAllAdmin();                    
                })
            },
            deleteAdmin(admin) {
                const url = '/admin/delete_admin.action',
                      that = this;
                Util.post( { url } , {data: admin} ).then((resp) => { 
                    this.$notify.success({
                        title: '删除成功',
                        message: resp.data.data.message,
                        offset: 100
                    });
                    that.fetchAllAdmin();                    
                })
            },
            addAdmin() {
                const url = '/admin/add_admin.action',
                    that = this;
                Util.post( { url } , {data:this.newAdmin} ).then((resp) => { 
                    this.$notify.success({
                        title: '新增成功',
                        message: resp.data.data.message,
                        offset: 100
                    });
                    that.fetchAllAdmin();
                })
            },
            fetchAllAdmin() {
                const url = '/admin/all_admin.action',
                      that = this;
                Util.get( { url } ).then((resp) => { 
                    that.adminList = resp.body.data;
                })
            }
        }
    }
</script>
