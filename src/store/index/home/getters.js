export default {
    classActivityInfo(state) {
        console.log(state.classActivityInfoList)
        return state.classActivityInfoList;
    },
    account(state) {
        return state.loginAccount;
    }
}