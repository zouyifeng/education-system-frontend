import actions from './actions'
import mutations from './mutations'
import getters from './getters'

const state = {
    loginAccount: {
        id: '',
        username: '',
        password: ''
    },
    classActivity: {
        list: [],
        years:[],
        pageInfo:{}
    },
    classActivityDetail: {
        article: {},
        years: []
    }
}

export default {
    state,
    actions,
    mutations,
    getters
}