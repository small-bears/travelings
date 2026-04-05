const state = {
  activeMenuArrary: [
    {name:"首页",url:"/index"}
  ],
  activeMenu: "/index",
}

const getters ={
  
}

const mutations = {
  setActiveMenu(state,menu) {
      state.activeMenu = menu
  },
  addActiveMenu(state,menu) {
      state.activeMenuArrary.push(menu)
  },
  setActiveMenuArrary(state,menu) {
      state.activeMenuArrary = menu
  },
  reduceActiveMenu(state,i) {
      state.activeMenuArrary.splice(i,1)
  },
}
 
const actions = {

}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
