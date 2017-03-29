<template>
    <div class="container">
        <div class="col-md-9">
            <router-view></router-view>
        </div>
        <div class="col-md-3">
            <h3>下载专区</h3>
            <a v-bind:href="Util.urlPrefix + '/resources/download/test.txt'" download="download">点我下载</a>
            <div class="list-group">
                <router-link to="/index/classInfo/sport" class="list-group-item" exact>体育</router-link>
                <router-link to="/index/classInfo/literature" class="list-group-item">文学</router-link>
                <router-link to="/index/classInfo/activity" class="list-group-item">活动</router-link>

            </div>
        </div>
    </div>
</template>
<script>

    import * as Util from '../../../store/util'

</script>