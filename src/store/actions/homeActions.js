// src/store/actions.js

import Vue from 'vue'

import * as types from './mutation-types'

export const homeActions = {
    updateAccount({ commit }, account) {
        Vue.http.jsonp('http://localhost:8081/wechat-education-system/admin/login.action', account).then((resp) => {
            commit(types.UPDATE_ACCOUNT, resp.body);
        },() => {
            console.log('error');
        });
    }
};