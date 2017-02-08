import Vue from 'vue'
import Vuex from 'vuex'
// import mutations from './mutations'
// import actions from './actions'

import home from './index/home'

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    home 
  }
})