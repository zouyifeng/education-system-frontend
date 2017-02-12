
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    fetchAccount({ commit }, account) {
        const url = '/admin/login.action';
        util.post({ url }, account).then((resp) => {
            commit(types.FETCH_ACCOUNT, resp.body.data);
        });
    },
    getClassActivityInfo({ commit }) {
        const url = '/article_list.action';
        util.get({ url }).then((resp) => {
            commit(types.GET_CLASS_ACTIVITY_INFO, resp.body.data);
        })
    }
};