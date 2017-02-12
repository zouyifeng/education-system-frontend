import * as types from './mutation-types'

export default {
    // 动态账户
    [types.FETCH_ACCOUNT](state, account) {
        state.loginAccount = account;
    },

    // 班级动态列表
    [types.GET_CLASS_ACTIVITY_INFO](state, classActivityInfo) {
        state.classActivityInfo = classActivityInfo;
    }
};