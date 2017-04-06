// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    closeEditDialogVisible({ commit }) {
        commit(types.CLOSE_EDIT_DIALOG_VISIBLE);
    },
    openEditDialogVisible({ commit }) {
        commit(types.OPEN_EDIT_DIALOG_VISIBLE);
    },
};