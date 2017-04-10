import actions from './actions'
import mutations from './mutations'
import getters from './getters'


const state = {
    teacher: {
        list:[],
        pageInfo: {
            pageSize: 10,
            pageNum: 1
        }
    }
}

export default {
    state,
    actions,
    mutations,
    getters
}