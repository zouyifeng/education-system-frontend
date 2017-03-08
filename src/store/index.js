import Vue from 'vue'
import Vuex from 'vuex'

import home from './index/home'
import news from './admin/news'
import teacher from './admin/teacher'
import student from './admin/student'

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    home,
    news,
    teacher,
    student
  }
})