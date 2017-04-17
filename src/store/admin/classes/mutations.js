import * as types from './mutation-types'

export default {
    // 班级动态列表
    [types.FETCH_ADMIN_CLASSES_LIST](state, classesList){
        state.classes = classesList;
    },
    [types.SEARCH_CLASSES](state, classesList){
        state.classes = classesList;
    },
    [types.FETCH_CLASSES_SCHEDULE](state, schedule){
        state.schedule = schedule;
    }
};