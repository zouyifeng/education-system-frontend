<template>
    <div id="h5">  
        <router-view></router-view>
    </div>
</template>
<script>
    import * as Util from './store/util'

    export default {
        created() {
            console.log(Util.getQueryObj('studentId'))
            if(Util.getQueryObj('studentId') != null) {
                this.$router.push({path: './h5StudentIndex'});
            } else if(Util.getQueryObj('teacherId')!= null) {
                this.$router.push({path: './h5TeacherIndex'});
                
            } else if(Util.getQueryObj('redirect') != null) {
                this.$router.push({path: './userLogin'});
            } else if(Util.getQueryObj('apply') != null) {
                console.log('xxx')
                this.$router.push({path: './h5Apply'});
            }
        }
    }
</script>
