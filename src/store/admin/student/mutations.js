import * as types from './mutation-types'

export default {
    // 班级动态列表
    [types.FETCH_ADMIN_STUDENT_LIST](state, studentList){
        state.student = studentList;
    },
    [types.SEARCH_STUDENT](state, studentList){
        state.student = studentList;
    }
};