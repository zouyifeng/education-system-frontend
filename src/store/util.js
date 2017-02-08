import vue from 'vue'

const _urlPrefix = 'http://localhost:8081/wechat-education-system';

export const get = ({ url }) => {

    return vue.http.get( _urlPrefix + url );
}


export const post = ({ url }, data) => {
    console.log(data)
    return vue.http.post( _urlPrefix + url, { data: data } );
}
