import Vue from 'vue'

import { Message } from 'element-ui';

export const urlPrefix = '/api';
// export const urlPrefix = '/wechat-education-system';

// const urlPrefix = 'http://zouyifeng.tunnel.qydev.com';

// const urlPrefix = 'http://zouyifeng.imwork.net';

export const get = ({ url }) => {
    var getPromise = Vue.http.get(urlPrefix + url);
    getPromise.then((resp) => {
        if (resp.body.data && resp.body.data.msg == '登陆超时') {
            Message.error('您已退出登录！');
            // Vue.$store.dispatch('changeLoginStatus');
            location.hash = '/management/index/home'
        }
    })
    return getPromise;
}

export const post = ({ url }, data) => {
    var postPromise = Vue.http.post(urlPrefix + url, data);
    postPromise.then((resp) => {
        if (resp.body.data && resp.body.data.msg == '登陆超时') {
            Message.error('您已退出登录！');
            // Vue.$store.dispatch('changeLoginStatus');            
            location.hash = '/management/index/home'
        }
    })
    return postPromise;
}

export const getQueryObj = (name)=>{
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return unescape(r[2]);
    }
    return null;
}

