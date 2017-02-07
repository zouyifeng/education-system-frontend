import Vue from 'vue'
import Vuex from 'vuex'
// import mutations from './mutations'
// import actions from './actions'

import { homeModules } from './homeModules'

Vue.use(Vuex);

const state = {
    loginAccout: {
        id: '',
        username: '',
        password: ''
    },
    classActivityInfoList: []
};

export default new Vuex.Store({
    state,
    mutations,
    actions
})