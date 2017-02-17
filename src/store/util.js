import vue from 'vue'

const _urlPrefix = 'http://localhost:8090';

// const _urlPrefix = 'http://localhost:8081';

export const get = ({ url }) => {
    return vue.http.get( _urlPrefix + url );
}

export const post = ({ url }, data) => {
    return vue.http.post( _urlPrefix + url, data );
}
