import vue from 'vue'

export const urlPrefix = 'http://localhost:80';

// const _urlPrefix = 'http://localhost:8081';

export const get = ({ url }) => {
    return vue.http.get( urlPrefix + url );
}

export const post = ({ url }, data) => {
    return vue.http.post( urlPrefix + url, data );
}
