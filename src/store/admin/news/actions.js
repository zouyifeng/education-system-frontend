// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    fetchAdminNews({ commit },data){
        const url = '/api/admin/news_list.action',
            fetchNewsPromise = util.post({ url }, data);

        fetchNewsPromise.then((resp) => {
            commit(types.FETCH_ADMIN_NEWS, resp.body.data);
        }, () => {
            console.error('Fetch admin news error!');            
        });

        return fetchNewsPromise;
    },
    editNews({ commit }, news) {
        const url = '/api/admin/news_add.action',
            editNewsPromise = util.post({ url }, news);
        // editNewsPromise.then((resp) => {
        //     commit(types.EDIT_NEWS, resp.body.data);
        // },() => {
        //     console.error('Edit news error!');
        // });
        return editNewsPromise;
    },
    deleteNews({ commit }, news) {
        const url = '/api/admin/news_delete.action',
            deleteNewsPromise = util.post({ url }, news);
        
        return deleteNewsPromise;
    },
    searchNews({ commit }, search) {
        
        const url = '/api/admin/news_select.action',
            searchNewsPromise = util.post({ url }, search);

        searchNewsPromise.then((resp) => {
            commit(types.SEARCH_NEWS, resp.body.data);
        }, () => {
            console.error('Search news error!');
        });

        return searchNewsPromise;
    }
};