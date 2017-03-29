// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    addTeacher({ commit }, teacher) {
        const url = '/admin/member_add.action';
        return util.post({ url }, teacher);
    },
    editTeacher({ commit }, teacher) {
        const url = '/admin/member_edit.action';
        return util.post({ url }, teacher);
    },
    fetchAdminTeacherList({ commit }, data) {
        const url = '/admin/member_list.action';
        util.post({ url }, data).then((resp) => {
            commit(types.FETCH_ADMIN_TEACHER_LIST, resp.body.data);
        }, () => {
            console.log('error');
        })
    },
    deleteTeacher({ commit }, teacher) {
        const url = '/admin/member_delete.action';
        return util.post({ url }, teacher) ;
    },
    searchTeacher({ commit }, teacher ) {
        const url = '/admin/member_select.action';
        util.post({ url }, teacher).then((resp)=>{
            commit(types.SEARCH_TEACHER, resp.body.data);
        });
    },
    fetchTeacherDetail({ commit }, teacher){
        const url = '/admin/member_editUI.action';
        return util.post({ url }, teacher);
    }
};