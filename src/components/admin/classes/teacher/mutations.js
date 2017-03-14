import * as types from './mutation-types'

export default {
    // 班级动态列表
    [types.FETCH_ADMIN_TEACHER_LIST](state, teacherList){
        state.teacher = teacherList;
    },
    [types.SEARCH_TEACHER](state, teacherList){
        state.teacher = teacherList;
    }
};