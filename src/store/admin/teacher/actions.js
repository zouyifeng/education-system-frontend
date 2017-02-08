// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    editArticle({ commit }, article) {
        const url = '/article_list.action';
        util.post({ url, article }).then((resp) => {
            commit(types.ADD_ARTICLE, resp.body);
        },() => {
            console.log('error');
        });
    },
    getArticleList({ commit }) {
        const url = 'admin/article_add.action';
        util.get({ url }).then((resp) => {
            commit(types.GET_ARTICLE_LIST, resp.body);
        }, () => {
            console.log('error');
        })
    }
};