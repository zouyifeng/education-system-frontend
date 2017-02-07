import homeActions from '../actions/homeActions'
import homeMutations from '../mutations/homeMutations'
import homeGetters from '../getters/homeGetters'

export const homeModules = {
    state: {
        loginAccount: {
            id: '',
            username: '',
            password: ''
        },
        classActivityInfoList: []
    },
    actions: homeActions,
    getters: homeGetters,
    mutations: homeMutations
}