// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    fetchTeacherList({ commit }, account) {
        const url = '/teacher_list.action';
        util.post({ url }, account ).then((resp) => {
            commit((types.GET_TEACHER_LIST), resp.body.data);
        });
    }
};