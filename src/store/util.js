import vue from 'vue'

const _urlPrefix = 'http://localhost:8081/wechat-education-system';

export const get = ({ url }, commit) => {
    console.log(url)
    console.log(commit)
    return vue.http.get( _urlPrefix + url )
        .then((resp) => {
            return res.data;
        })
}


export const post = ({url, data}, commit) => {
    console.log(url)
    console.log(data)
    return vue.http.post( _urlPrefix + url, data )
        .then((resp) => {
            return res.data;
        })
}
