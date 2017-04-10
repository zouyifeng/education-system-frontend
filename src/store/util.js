import Vue from 'vue'

export const urlPrefix = 'http://localhost:8090/api';

// const urlPrefix = 'http://zouyifeng.tunnel.qydev.com';

// const urlPrefix = 'http://zouyifeng.imwork.net';

export const get = ({ url }) => {
    var getPromise = Vue.http.get( urlPrefix + url );
    getPromise.then((resp)=>{
        if(resp.body.data.msg == '登陆超时'){
            location.hash = '/management/index/home'            
        }    
    })
    return getPromise;
}

export const post = ({ url }, data) => {
    var postPromise = Vue.http.post( urlPrefix + url, data );
    postPromise.then((resp)=>{
        if(resp.body.data.msg == '登陆超时'){
            location.hash = '/management/index/home'
        }   
    })
    return postPromise;
}
