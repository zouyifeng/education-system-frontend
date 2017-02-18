<template>
    <el-button type="text" @click="msg">{{}}</el-button>
</template>
<script>
    import { MessageBox } from 'element-ui'

    export default {
        props: {
            action: {
                type: [String],
                required: true
            },
            callback: {
                default() {
                    return function callback() {
                        // todo
                    }
                }
            },
             methods: {
                msg() {
                    MessageBox.confirm('此操作将永久删除该项, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning',
                        callback: 'callback'
                    }).then(() => {
                        MessageBox({
                            type: 'success',
                            message: '删除成功!'
                        });
                    }).catch(() => {
                        MessageBox({
                            type: 'info',
                            message: '已取消删除'
                        });          
                    });
                }
                }
        }
    }


</script> 