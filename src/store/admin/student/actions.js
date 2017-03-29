// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    addStudent({ commit }, student) {
        const url = '/admin/member_add.action';
        return util.post({ url }, student);
    },
    editStudent({ commit }, student) {
        const url = '/admin/member_edit.action';
        return util.post({ url }, student);
    },
    fetchAdminStudentList({ commit }, data) {
        const url = '/admin/member_list.action';
        util.post({ url }, data).then((resp) => {
            commit(types.FETCH_ADMIN_STUDENT_LIST, resp.body.data);
        }, () => {
            console.log('error');
        })
    },
    deleteStudent({ commit }, student) {
        const url = '/admin/member_delete.action';
        return util.post({ url }, student) ;
    },
    searchStudent({ commit }, student ) {
        const url = '/admin/member_select.action';
        util.post({ url }, student).then((resp)=>{
            commit(types.SEARCH_STUDENT, resp.body.data);
        });
    },
    fetchStudentDetail({ commit }, student){
        const url = '/admin/member_editUI.action';
        return util.post({ url }, student);
    }
};