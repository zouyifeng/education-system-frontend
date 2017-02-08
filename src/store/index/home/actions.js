
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    updateAccount({ commit }, account) {
        const url = '/admin/login.action';
        console.log(account)
        util.post({ url }, account).then((resp) => {
            console.log(resp.body)
            commit(types.UPDATE_ACCOUNT, resp.body);
        });
    },
    getClassActivityInfo({ commit }) {
        const url = '/article_list.action';
        util.get({ url }).then((resp) => {
            console.log(resp.body)
        })
    }
};