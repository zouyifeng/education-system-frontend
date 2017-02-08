import Vue from 'vue'
import Vuex from 'vuex'

import home from './index/home'

Vue.use(Vuex);

console.log(home)

export default new Vuex.Store({
    modules: {
        home
    }
})