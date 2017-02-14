// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    editNews({ commit }, news) {
        const url = '/admin/news_add.action';
        util.post({ url }, news).then((resp) => {
            commit(types.EDIT_NEWS, resp.body);
        },() => {
            console.error('Edit news error!');
        });
    }
};