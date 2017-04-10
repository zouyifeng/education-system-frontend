<template>
    <el-carousel :interval="5000" arrow="always">
        <el-carousel-item v-for="item in imgList">
        <img :src="item.path" alt="">
        </el-carousel-item>
    </el-carousel>
</template>
<style lang="scss">
    img {
        width: 100%;
    }
</style>
<script>

    import * as Util from '../../../store/util'

    export default {
        data () {
            return {
                imgList: [],
                urlPrefix: Util.urlPrefix
            }
        },
        created() {
            const url = '/news_img.action';

             Util.get({ url }).then((resp) => {
                this.imgList = resp.data.data;
            });
        }
    }
</script>