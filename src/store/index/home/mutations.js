import * as types from './mutation-types'

export default {
    // 动态账户
    [types.FETCH_ACCOUNT](state, account) {
        state.loginAccount = account;
    },

    // 班级动态列表
    [types.FETCH_CLASS_ACTIVITY_INFO_LIST](state, classActivityInfoList) {
        state.classActivityInfo = classActivityInfoList;
    },

    // 班级动态详情
    [types.FETCH_CLASS_ACTIVITY_INFO_DETAIL](state, classActivityInfoDetail) {
        state.classActivityInfoDetail = classActivityInfoDetail;
    }
};