import * as types from './mutation-types'

export default {
    // 动态账户
    [types.UPDATE_ACCOUNT](state, account) {
        state.loginAccout = account;
    },

    // 班级动态列表
    [types.GET_CLASS_ACTIVITY_INFO](state, classActivityInfoList){
        state.classActivityInfoList = classActivityInfoList;
    }
};