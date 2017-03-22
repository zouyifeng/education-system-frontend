import * as types from './mutation-types'

export default {
    [types.GET_TEACHER_LIST](state, teacherList) {
        state.teacherList = teacherList;
    }
};