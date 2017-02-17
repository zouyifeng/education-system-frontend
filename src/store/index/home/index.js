import actions from './actions'
import mutations from './mutations'
import getters from './getters'

const state = {
    loginAccount: {
        id: '',
        username: '',
        password: ''
    },
    news: {
        list: [],
        years:[],
        pageInfo:{
            pageNum:'',
            pageSize:'',
            pages:'',
            size:'',
            total:''
        }
    },
    newsDetail: {
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