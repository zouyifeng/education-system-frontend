<template>
    <div>
        <div class="trans-header">翻译小助手</div>
        <el-form class="h5-trans">
            <el-form-item label="翻译窗口">
                <el-input type="textarea" v-model="trans.src" placeholder="请输入要翻译的内容（词，句）"></el-input>
            </el-form-item>
            <el-form-item label="翻译结果">
                <br>
                <div v-text="trans.dst"></div>
            </el-form-item>
            <el-form-item>
                <el-button type="warning" @click="submit">点我翻译</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<style lang="scss">
    .h5-trans {
        padding: 60px 10px;
    }
    .trans-header {
        width: 100%;
        height: 45px;
        background-color: #67de56;
        line-height: 45px;
        font-size: 15px;
        color: #fff;
        padding: 0 10px;
        position: fixed;
        z-index: 999;
    }
    .news-context {
        font-size: 14px;
    }
    .news-info {
        font-size: 15px;
        color: #999;
    }
</style>
<script>

import { mapGetters } from 'vuex'
import * as Util from '../../store/util'

export default {
    data() {
        return {
            trans: {
                src: '',
                dst: ''
            },
        }
    },
    methods: {
        submit() {
            const url = '/wechat/translate.action',
                  that = this;
            Util.post({ url }, { data: that.trans }).then((resp)=>{
                that.trans = resp.body.data;
            }) 
        }
    }
}
</script>