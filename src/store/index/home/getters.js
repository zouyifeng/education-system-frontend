export default {
    classActivity(state) {
        return state.classActivity;
    },
    getCurrentAccount(state) {
        return state.loginAccount;
    },
    getClassActivityDetailArticle(state) {
        console.log(state)
        return state.classActivityDetail.article;
    }
}