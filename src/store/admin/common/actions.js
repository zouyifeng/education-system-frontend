// src/store/actions.js
import * as util from '../../util'

import * as types from './mutation-types'

export default {
    changeEditDialogVisible({ commit }) {
        commit(types.CHANGE_EDIT_DIALOG_VISIBLE);
    }
};