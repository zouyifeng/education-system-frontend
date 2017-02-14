import actions from './actions'
import mutations from './mutations'
import getters from './getters'


const state = {
    news: {
        years: [],
        article: {}
    }
}

export default {
    state,
    actions,
    mutations,
    getters
}