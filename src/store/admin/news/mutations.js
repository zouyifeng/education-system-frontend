import * as types from './mutation-types'

export default {
    // 动态账户
    [types.EDIT_NEWS](state, news) {
        state.news = news;
    },

};