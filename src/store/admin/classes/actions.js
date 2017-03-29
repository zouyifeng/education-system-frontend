// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    addClasses({ commit }, classes) {
        const url = '/admin/classes_add.action';
        return util.post({ url }, classes);
    },
    editClasses({ commit }, classes) {
        const url = '/admin/classes_edit.action';
        return util.post({ url }, classes);
    },
    fetchAdminClassesList({ commit }, data) {
        const url = '/admin/classes_list.action';
        util.post({ url }, data).then((resp) => {
            commit(types.FETCH_ADMIN_CLASSES_LIST, resp.body.data);
        }, () => {
            console.log('error');
        })
    },
    deleteClasses({ commit }, classes) {
        const url = '/admin/classes_delete.action';
        return util.post({ url }, classes) ;
    },
    searchClasses({ commit }, classes ) {
        const url = '/admin/classes_select.action';
        util.post({ url }, classes).then((resp)=>{
            commit(types.SEARCH_CLASSES, resp.body.data);
        });
    },
    fetchClassesDetail({ commit }, classes){
        const url = '/admin/classes_editUI.action';
        return util.post({ url }, classes);
    }
};