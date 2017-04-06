import * as types from './mutation-types'

export default {
    // 动态账户
    [types.FETCH_ACCOUNT](state, account) {
        state.loginAccount = account;
    },

    // 新闻列表
    [types.FETCH_NEWS_LIST](state, news) {
        state.news = news;
    },

    // 新闻详情
    [types.FETCH_NEWS_DETAIL](state, newsDetail) {
        state.newsDetail = newsDetail;
    },

    // 新闻列表
    [types.FETCH_NEWS_BY_PAGE](state, news){
        state.news = news;
    },

    [types.CHANGE_LOGIN_STATUS](state) {
        state.loginStatus = !state.loginStatus;
    }
};