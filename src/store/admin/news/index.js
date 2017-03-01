import actions from './actions'
import mutations from './mutations'
import getters from './getters'


const state = {
    news: {
        years: [],
        list: [],
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