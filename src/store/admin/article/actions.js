// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    editArticle({ commit }, article) {
        const url = '/admin/article_add.action';
        util.post({ url }, article).then((resp) => {
            console.log('submit')
            commit(types.EDIT_ARTICLE, resp.body);
        },() => {
            console.log('editArticle error');
        });
    },
    getArticleList({ commit }) {
        const url = '/article_list.action';
        util.get({ url }).then((resp) => {
            commit(types.GET_ARTICLE_LIST, resp.body);
        }, () => {
            console.log('getArticleList error');
        });
    }
};