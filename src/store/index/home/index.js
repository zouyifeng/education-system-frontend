import actions from './actions'
import mutations from './mutations'
import getters from './getters'

const state = {
    loginAccount: {
        id: '',
        username: '',
        password: ''
    },
    classActivityInfo: {
        list: [],
        years:[],
        pageInfo:{}
    },
    classActivityInfoDetail: {
    }
}

export default {
    state,
    actions,
    mutations,
    getters
}