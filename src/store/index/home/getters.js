export default {
    getClassNews(state) {
        return state.classNews;
    },
    getStudyNews(state) {
        return state.studyNews;
    },
    getExchangeNews(state) {
        return state.exchangeNews;
    },
    getInformNews(state) {
        return state.informNews;
    },
    getCurrentAccount(state) {
        return state.loginAccount;
    },
    getNewsDetail(state) {
        return state.newsDetail;
    },
    getLoginStatus(state) {
        console.log(state.loginStatus)
        return state.loginStatus;
    }
}