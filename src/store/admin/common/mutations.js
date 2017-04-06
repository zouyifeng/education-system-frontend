import * as types from './mutation-types'

export default {
    [types.CLOSE_EDIT_DIALOG_VISIBLE](state) {
        state.editDialogVisible = false;
    },

    [types.OPEN_EDIT_DIALOG_VISIBLE](state) {
        state.editDialogVisible = true;
    }
};