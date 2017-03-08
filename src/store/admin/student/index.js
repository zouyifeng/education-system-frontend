import actions from './actions'
import mutations from './mutations'
import getters from './getters'


const state = {
    student: {
        list:[],
        pageInfo: {
            pages: '',
            pageNum: ''
        }
    }
}

export default {
    state,
    actions,
    mutations,
    getters
}