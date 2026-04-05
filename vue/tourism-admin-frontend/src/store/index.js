import Vue from 'vue'
import Vuex from 'vuex'
import user from './modules/user' 
import menu from './modules/menu' 
import configure from './modules/configure' 

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    user,
    menu,
    configure
  }
})
