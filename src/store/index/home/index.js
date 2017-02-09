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
        list: [{title: 'title',date: '2017-02-02', source: 'haoa'}],
        years:[],
        pageInfo:{}
    }
}

export default {
    state,
    actions,
    mutations,
    getters
}