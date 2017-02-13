import * as types from './mutation-types'

export default {
    // 动态账户
    [types.FETCH_ACCOUNT](state, account) {
        state.loginAccount = account;
    },

    // 班级动态列表
    [types.FETCH_CLASS_ACTIVITY_LIST](state, classActivityList) {
        state.classActivity = classActivityList;
    },

    // 班级动态详情
    [types.FETCH_CLASS_ACTIVITY_DETAIL](state, classActivityDetail) {
        state.classActivityDetail = classActivityDetail;
    }
};