<template>
    <el-col :span="23" :offset="1" class="mt-15">
        <el-form :inline="true" :model="search" class="demo-form-inline">
            <el-form-item label="文件类型">
                <el-select v-model="search.type" placeholder="文件类型">
                    <el-option label="全部" value="null"></el-option>
                    <el-option label="学务科" value="1"></el-option>
                    <el-option label="教务科" value="2"></el-option>
                    <el-option label="考务科" value="3"></el-option>
                    <el-option label="学籍科" value="4"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="文件名">
                <el-input v-model="search.name"  placeholder="文件名"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary"  @click="searchFile">搜索文件</el-button>
            </el-form-item>
            <el-form-item>
                <el-button type="success"  @click="$store.dispatch('openEditDialogVisible')">上传文件</el-button>
            </el-form-item>
        </el-form>
        <el-table :data="fileList.list" stripe style="width: 100%">
            <el-table-column type="index" label="序号"  width="80px"></el-table-column>
            <el-table-column prop="name" label="文件名"></el-table-column>
            <el-table-column prop="path" label="下载路径"></el-table-column>
            <el-table-column prop="type" label="文件类型" inline-template><div>{{typeMap[row.type]}}</div></el-table-column>
            <el-table-column label="操作">
                <template scope="scope">
                    <el-button size="small" type="danger" @click="deleteFile(scope.row)">删除文件</el-button>         
                </template>
            </el-table-column>
        </el-table>
        <div class="pull-right block">
            <el-pagination
                layout="total,prev, pager, next"
                :current-page="fileList.pageInfo.pageNum"
                :page-size="6"
                :total="fileList.pageInfo.total"
                @current-change="nextPage">
            </el-pagination>
        </div>
        <el-dialog title="修改密码" v-model="dialogFormVisible" size="small" @close="$store.dispatch('closeEditDialogVisible')">
            <el-form>
                <el-form-item label="文件类型" label-width="120px">
                    <el-select v-model="uploadFile.type" placeholder="文件类型">
                        <el-option label="学务科" value="1"></el-option>
                        <el-option label="教务科" value="2"></el-option>
                        <el-option label="考务科" value="3"></el-option>
                        <el-option label="学籍科" value="4"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="上传区域" label-width="120px">
                    <el-upload
                        class="upload-demo"
                        drag
                        v-bind:action="urlPrefix +  '/admin/file_upload.action'"
                        :on-success="uploadSuccess"
                        :on-remove="removeFile">
                        <i class="el-icon-upload"></i>
                        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
                        <div class="el-upload__tip" slot="tip">可以上传jpg/pdf/ppt等文件</div>
                    </el-upload>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible">取 消</el-button>
                <el-button type="primary" @click="$store.dispatch('closeEditDialogVisible'); confirmUpload()">确 定</el-button>
            </div>
        </el-dialog>
    </el-col>
</template>
<script>    
    import * as Util from '../../../store/util'

    import { mapGetters } from 'vuex'

    export default {
        data() {
            return {
                search: {
                    type: null,
                    name: ''
                },
                uploadFile: {
                    type: null,
                    name: '',
                    path: ''
                },
                fileList: {
                    list: [],
                    pageInfo:{}
                },
                typeMap: {
                    '1': '学务科',
                    '2': '教务科',
                    '3': '考务科',
                    '4': '学籍科'
                },
                // typeMap: ['学务科', '教务科', '考务科','学籍科'],
                uploadedFileList: [],
                urlPrefix: Util.urlPrefix
            }
        },
        created() {
            this.fetchAllFile();
        },
        computed: mapGetters({
            dialogFormVisible : 'getEditDialogVisible'
        }),
        methods: {
            searchFile() {
                const url = '/admin/file_select.action',
                      that = this;
                Util.post( { url } ,{data: that.search, pageInfo: {pageNum: 1}}).then((resp) => { 
                    that.fileList = resp.body.data;
                })
            },
            deleteFile(file) {
                const url = '/admin/delete_file.action',
                      that = this;
                Util.post( { url } , {data: file} ).then((resp) => { 
                    console.log(resp)
                    this.$notify.success({
                        title: '删除成功',
                        message: resp.data.data.message,
                        offset: 100
                    });
                    that.fetchAllFile();                    
                })
            },
            confirmUpload() {
                console.log(this.uploadedFileList)
                
                const url = '/admin/add_files.action',
                    that = this;
                Util.post( { url } , { data: {filesList : that.uploadedFileList} } ).then((resp) => { 
                    this.$notify.success({
                        title: '上传成功',
                        message: resp.data.data.message,
                        offset: 100
                    });
                    that.fetchAllFile();
                })
            },
            fetchAllFile() {
                const url = '/admin/file_select.action',
                      that = this;
                Util.post( { url } ,{pageInfo: {pageNum: 1}}).then((resp) => { 
                    that.fileList = resp.body.data;
                })
            },
            uploadSuccess(response) {
                response.data.type = this.uploadFile.type;
                // console.log(response)
                this.uploadedFileList.push(response.data);
                console.log(this.uploadedFileList)
                // this.uploadFile = response.data;
            },
            removeFile(file) {
                for(var i=0; i<this.uploadedFileList; i++) {
                    if(this.uploadedFileList[i].name == file.response.data.name) {
                        this.uploadedFileList.splice(i, 1);
                    }
                }
            },
            nextPage(page) {
                this.fileList.pageInfo.pageNum = page;
                const url = '/admin/file_select.action',
                      that = this;
                Util.post( { url } ,{data: {}, pageInfo: {pageNum: page}}).then((resp) => { 
                    that.fileList = resp.body.data;
                })
            }
        }
    }
</script>
