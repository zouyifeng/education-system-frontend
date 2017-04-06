import Vue from 'vue'

console.log(Vue)
export const urlPrefix = 'http://localhost:8090/api';

// const urlPrefix = 'http://zouyifeng.tunnel.qydev.com';

export const get = ({ url }) => {
    var getPromise = Vue.http.get( urlPrefix + url );
    getPromise.then((resp)=>{
        if(resp.body.data.msg == '登陆超时'){
            // Vue.$router.push({path : '../index/home'});
            location.hash = '/index/home'            
        }    
    })
    return getPromise;
}

export const post = ({ url }, data) => {
    var postPromise = Vue.http.post( urlPrefix + url, data );
    postPromise.then((resp)=>{
        if(resp.body.data.msg == '登陆超时'){
            // console.log(Vue)
            location.hash = '/index/home'
            // Vue.$router.push({path : '../index/home'});
        }   
    })
    return postPromise;
}
