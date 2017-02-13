
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    fetchAccount({ commit }, account) {
        const url = '/admin/login.action';
        util.post({ url }, account).then((resp) => {
            commit(types.FETCH_ACCOUNT, resp.body.data);
        });
    },
    getClassActivity({ commit }) {
        const url = '/article_list.action';
        util.get({ url }).then((resp) => {
            commit(types.FETCH_CLASS_ACTIVITY_LIST, resp.body.data);
        })
    },
    getClassActivityDetatil({ commit }, id) {
        const url = '/article.action';
        util.post({ url }, id).then((resp) => {
            commit(types.FETCH_CLASS_ACTIVITY_DETAIL, resp.body.data)
        })
    }
};