<template>
    <div class="container">
        <div class="col-md-3">
            <el-card class="box-card">
                <div slot="header" class="clearfix">
                    <h2 style="line-height: 36px;">下载专区</h2>
                </div>
                <ul>
                    <li class="download-item">
                        <div class="download-subject">学籍科：</div>
                        <div class="download-area">
                            <div class="download-area">
                            <a class="download-btn" v-for="item in fileList[0]" v-bind:href="item.path" download="download">
                                <el-tag type="warning">{{item.name}}</el-tag>
                            </a>    
                        </div>                    
                        </div>
                    </li>
                    <li class="download-item">
                    <div class="download-subject">教务科</div>
                        <div class="download-area">
                            <div class="download-area">
                            <a class="download-btn" v-for="item in fileList[1]" v-bind:href="item.path" download="download">
                                <el-tag type="normal">{{item.name}}</el-tag>
                            </a>    
                        </div>                     
                        </div>
                    </li>
                    <li class="download-item">
                        <div class="download-subject">考务科：</div>
                        <div class="download-area">
                            <a class="download-btn" v-for="item in fileList[2]" v-bind:href="item.path" download="download">
                                <el-tag type="success">{{item.name}}</el-tag>
                            </a>    
                        </div>
                    </li>
                    <li class="download-item">
                        <div class="download-subject">学籍科：</div>
                        <div class="download-area">
                            <a class="download-btn" v-for="item in fileList[3]" v-bind:href="item.path" download="download">
                                <el-tag type="danger">{{item.name}}</el-tag>
                            </a>                                                                                     
                        </div>
                    </li>
                </ul>
            </el-card>
        </div>
    </div>
</template>
<style lang="scss">
    .download-btn {
        display: inline-block;
        margin-right: 10px;
    }
    .red-bg{
        background: red;
    }
    .green-bg {
        background: green;
    }
    .yellow-bg {
        background: yellow;
    }
    .download-item {
        min-height: 80px;
        overflow: hidden;
        border-bottom: 1px solid #ddd;
    }
    .download-subject {
        width: 100px;
        float: left;
        line-height: 80px;
    }
    .download-area {
        line-height: 80px;
        float: left;
    }
 </style>
<script>

    import * as Util from '../../../store/util'

    export default {
        data() {
            return {
                fileList: [],
            }
        },
        created() {
            const url = '/file_list.action',
                  that = this;
            for(let i=1; i<=4; i++) {
                const data = {
                    type: i
                }
                Util.post({ url }, {data: data}).then((resp)=>{
                    that.fileList.push(resp.body.data);
                });
            }
        }
    }

</script>