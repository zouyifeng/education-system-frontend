import actions from './actions'
import mutations from './mutations'
import getters from './getters'


const state = {
    news: {
        years: [],
        list: [],
        pageInfo: {
            pageNum: 1,
            pageSize: 10
        }
    }
}

export default {
    state,
    actions,
    mutations,
    getters
}