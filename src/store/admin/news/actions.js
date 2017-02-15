// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    fetchAdminNews({ commit }){
        const url = '/api/admin/news_list.action',
            fetchNewsPromise = util.get({ url });

        fetchNewsPromise.then((resp) => {
        console.log(resp.body)
            commit(types.FETCH_ADMIN_NEWS, resp.body);
        }, () => {
            console.error('Fetch admin news error!');            
        });

        return fetchNewsPromise;
    },
    editNews({ commit }, news) {
        const url = '/api/admin/news_add.action',
            editNewsPromise = util.post({ url }, news);
        editNewsPromise.then((resp) => {
            console.log(resp.body)
            commit(types.EDIT_NEWS, resp.body);
        },() => {
            console.error('Edit news error!');
        });
        return editNewsPromise;
    },
    deleteNews({ commit }, news) {
        console.log(news)
        const url = '/api/admin/news_delete.action',
            deleteNewsPromise = util.post({ url }, news);
        
        return deleteNewsPromise;
    },
    searchNews({ commit }, search) {
        
        const url = '/api/admin/news_select.action',
            searchNewsPromise = util.post({ url }, search);

        searchNewsPromise.then((resp) => {
            commit(types.SEARCH_NEWS, resp.body);
        }, () => {
            console.error('Search news error!');
        });

        return searchNewsPromise;
    }
};