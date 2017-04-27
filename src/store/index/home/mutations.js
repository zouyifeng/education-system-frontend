import * as types from './mutation-types'

export default {
    // 动态账户
    [types.FETCH_ACCOUNT](state, account) {
        state.loginAccount = account;
    },

    // 新闻列表
    [types.FETCH_CLASS_NEWS_LIST](state, news) {
        state.classNews = news;
    },
    
    // 新闻列表
    [types.FETCH_INFORM_NEWS_LIST](state, news) {
        state.informNews = news;
    },

    // 新闻列表
    [types.FETCH_EXCHANGE_NEWS_LIST](state, news) {
        state.exchangeNews = news;
    },

    // 新闻列表
    [types.FETCH_STUDY_NEWS_LIST](state, news) {
        state.studyNews = news;
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
        console.log(sessionStorage.loginStatus === undefined)
        if(sessionStorage.loginStatus === 'false' || sessionStorage.loginStatus === undefined) {
            sessionStorage.loginStatus = true;
        } else if(sessionStorage.loginStatus === 'true') {
            sessionStorage.loginStatus = false;            
        }
        state.loginStatus = sessionStorage.loginStatus === 'true' ? true : false;
    }
};