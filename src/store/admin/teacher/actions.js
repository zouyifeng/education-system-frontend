// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    addTeacher({ commit }, teacher) {
        const url = '/admin/teacher_add.action';
        return util.post({ url }, teacher);
    },
    editTeacher({ commit }, teacher) {
        const url = '/admin/teacher_edit.action';
        return util.post({ url }, teacher);
    },
    fetchAdminTeacherList({ commit }, data) {
        const url = '/admin/teacher_list.action';
        util.post({ url }, data).then((resp) => {
            commit(types.FETCH_ADMIN_TEACHER_LIST, resp.body.data);
        }, () => {
            console.log('error');
        })
    },
    deleteTeacher({ commit }, teacher) {
        const url = '/admin/teacher_delete.action';
        return util.post({ url }, teacher) ;
    },
    searchTeacher({ commit }, teacher ) {
        const url = '/admin/teacher_select.action';
        util.post({ url }, teacher).then((resp)=>{
            commit(types.SEARCH_TEACHER, resp.body.data);
        });
    },
    fetchAdminTeacherDetail({ commit }, teacher){
        const url = '/teacher_editUI.action';
        return util.post({ url }, teacher);
    }
};