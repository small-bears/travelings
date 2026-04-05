import Vue from 'vue'
import VueRouter from 'vue-router'
import login from '@/views/logIn/logIn'
import register from '@/views/register/register'
import forget from '@/views/forget/forget'
import index from '@/views/index/index'
import attractions from '@/views/attractions/attractions'
import line from '@/views/line/line'
import hotel from '@/views/hotel/hotel'
import forum from '@/views/forum/forum'
import favor from '@/views/favor/favor'
import order from '@/views/order/order'
import attractionsInfo from '@/views/attractions/attractionsInfo'
import hotelInfo from '@/views/hotel/hotelInfo'
import forumInfo from '@/views/forum/forumInfo'
import lineInfo from '@/views/line/lineInfo'
import center from '@/views/center/center'
import error404 from '@/views/error/404'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'login',
    component: login,
  },
  {
    path: '/register',
    name: 'register',
    component: register,
  },
  {
    path: '/forget',
    name: 'forget',
    component: forget,
  },
  {
    path: '/',
    name: 'index',
    component: index,
  },
  {
    path: '/attractions',
    name: 'attractions',
    component: attractions,
  },
  {
    path: '/line',
    name: 'line',
    component: line,
  },
  {
    path: '/hotel',
    name: 'hotel',
    component: hotel,
  },
  {
    path: '/forum',
    name: 'forum',
    component: forum,
  },
  {
    path: '/favor',
    name: 'favor',
    component: favor,
  },
  {
    path: '/order',
    name: 'order',
    component: order,
  },
  {
    path: '/attractionsInfo',
    name: 'attractionsInfo',
    component: attractionsInfo,
  },
  {
    path: '/hotelInfo',
    name: 'hotelInfo',
    component: hotelInfo,
  },
  {
    path: '/forumInfo',
    name: 'forumInfo',
    component: forumInfo,
  },
  {
    path: '/lineInfo',
    name: 'lineInfo',
    component: lineInfo,
  },
  {
    path: '/center',
    name: 'center',
    component: center,
  },
  {
    path: '/404',
    name: '404',
    component: error404,
  },
  { 
    path: '/:pathMatch(.*)',
    redirect: '/404'
  },
]

// 防止连续点击多次路由报错
let routerPush = VueRouter.prototype.push;
let routerReplace = VueRouter.prototype.replace;
// push
VueRouter.prototype.push = function push(location) {
  return routerPush.call(this, location).catch(err => err)
}
// replace
VueRouter.prototype.replace = function push(location) {
  return routerReplace.call(this, location).catch(err => err)
}

const router = new VueRouter({
  mode: 'history',
  routes
})

export default router
