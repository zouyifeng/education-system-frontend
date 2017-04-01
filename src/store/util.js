import vue from 'vue'

// export const urlPrefix = 'http://localhost:8090/api';

const urlPrefix = 'http://zouyifeng.tunnel.qydev.com';

export const get = ({ url }) => {
    return vue.http.get( urlPrefix + url );
}

export const post = ({ url }, data) => {
    return vue.http.post( urlPrefix + url, data );
}
