<template>
    <rd-swipe :swipe="swipe">
        <div 
            class="rd-swipe-item" 
            :style="{ 'background-image': `url(${img})` }" 
            v-for="(img, index) in imgs">
        </div>
    </rd-swipe>
</template>
<script>
    // import rdSwipe from 'vue-slide'
    export default {
    data () {
        return {
            swipe: {
                activeIndex: 0
            },
            imgs: [
                'http://covteam.u.qiniudn.com/test18.jpg',
                'http://covteam.u.qiniudn.com/test19.jpg',
                'http://covteam.u.qiniudn.com/test20.jpg',
                'http://covteam.u.qiniudn.com/test21.jpg'
            ]
            }
        }
    }
</script>