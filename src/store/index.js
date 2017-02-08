import Vue from 'vue'
import Vuex from 'vuex'

import home from './index/home'

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    home 
  }
})