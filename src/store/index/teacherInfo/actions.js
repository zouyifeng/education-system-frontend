// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    fetchTeacherList({ commit }, account) {
        const url = '/member_list.action';
        util.post({ url }, account ).then((resp) => {
            console.log(resp.body.data)
            commit((types.GET_TEACHER_LIST), resp.body.data);
        },() => {
            console.log('error');
        });
    }
};