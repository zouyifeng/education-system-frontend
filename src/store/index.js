import Vue from 'vue'
import Vuex from 'vuex'

import home from './index/home'
import article from './admin/article'

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    home,
    article
  }
})