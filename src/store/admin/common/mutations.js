import * as types from './mutation-types'

export default {
    [types.CHANGE_EDIT_DIALOG_VISIBLE](state) {
        state.editDialogVisible = !state.editDialogVisible;
    }
};