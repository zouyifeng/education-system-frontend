import * as types from './mutation-types'

export default {
    // 动态账户
    [types.FETCH_ACCOUNT](state, account) {
        state.loginAccount = account;
    },

    // 班级动态列表
    [types.FETCH_NEWS_LIST](state, news) {
        state.news = news;
    },

    // 班级动态详情
    [types.FETCH_NEWS_DETAIL](state, newsDetail) {
        state.newsDetail = newsDetail;
    }
};