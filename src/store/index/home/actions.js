import * as util from '../../util'

import * as types from './mutation-types'

export default {
    fetchAccount({ commit }, account) {
        const url = '/admin/login.action';
        util.post({ url }, account).then((resp) => {
            commit(types.FETCH_ACCOUNT, resp.body.data);
        });
    },
    getNews({ commit }, data) {
        const url = '/news_list.action';
        util.post({ url }, data).then((resp) => {
            commit(types.FETCH_NEWS_LIST, resp.body.data);
        })
    },
    getNewsDetail({ commit }, id) {
        const url = '/news.action';
        return util.post({ url }, id);
    },
    getNewsByPage({ commit }, data) {
        const url = '/news_page.action';
        util.post({ url }, data).then((resp) => {
            commit(types.FETCH_NEWS_BY_PAGE, resp.body.data);
        });
    }
};