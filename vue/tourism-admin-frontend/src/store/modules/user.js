import { logout } from '@/api/api'
const state = {
  token: "",
  user: "",
}
const getters ={
  getToken(state) {
    if (state.token) {
      return state.token
    } else {
      return window.localStorage.getItem("token")
    }
  },
  getUser(state) {
    if (state.user) {
      return state.user
    } else {
      return window.localStorage.getItem("user")
    }
  }
}
  
const mutations = {
    setToken(state,token) {
      state.token = token
      window.localStorage.setItem("token",token)
    },
    setUser(state,user) {
      state.user = user
      window.localStorage.setItem("user",user)
    }
}

const actions = {
  logout({ commit }) {
    return new Promise(resolve => {
      commit('setToken', '')
      commit('setUser', '')
      window.localStorage.removeItem("token")
      logout()
      resolve()
    })
  }
}
  
export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
  