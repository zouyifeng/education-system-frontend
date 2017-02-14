import * as util from '../../util'

import * as types from './mutation-types'

export default {
    fetchAccount({ commit }, account) {
        const url = '/admin/login.action';
        util.post({ url }, account).then((resp) => {
            commit(types.FETCH_ACCOUNT, resp.body.data);
        });
    },
    getNews({ commit }) {
        const url = '/news_list.action';
        util.get({ url }).then((resp) => {
            commit(types.FETCH_NEWS_LIST, resp.body.data);
        })
    },
    getNewsDetail({ commit }, id) {
        const url = '/news.action';
        util.post({ url }, id).then((resp) => {
            commit(types.FETCH_NEWS_DETAIL, resp.body.data)
        })
    }
};