import Vue from 'vue'
import Vuex from 'vuex'

import home from './index/home'
import teacherInfo from './index/teacherInfo'
import news from './admin/news'
import teacher from './admin/teacher'
import student from './admin/student'
import classes from './admin/classes'
import Common from './admin/common'

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    home,
    news,
    teacher,
    student,
    classes,
    teacherInfo,
    Common
  }
})