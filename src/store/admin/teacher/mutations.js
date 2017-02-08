import * as types from './mutation-types'

export default {
    // 动态账户
    [types.EDIT_ARTICLE](state, article) {
        state.article = article;
    },

    // 班级动态列表
    [types.GET_ARTICLE_LIST](state, articleList){
        state.articleList = articleList;
    }
};