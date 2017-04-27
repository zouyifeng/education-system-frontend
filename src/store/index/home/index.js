import actions from './actions'
import mutations from './mutations'
import getters from './getters'

const state = {
    loginAccount: {
        id: '',
        username: '',
        password: ''
    },
    classNews: {
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
    informNews: {
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
    exchangeNews: {
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
    studyNews: {
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
        news: {},
        years: []
    },
    loginStatus: sessionStorage.loginStatus === 'true' ? true : false
}

export default {
    state,
    actions,
    mutations,
    getters
}