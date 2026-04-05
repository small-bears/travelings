import Vue from 'vue'
import VueRouter from 'vue-router'
import login from '@/views/system/login/login'
import main from '@/views/layout/index'
import index from '@/views/system/index/index'
import attractions from '@/views/system/attractions/attractions'
import admin from '@/views/system/user/admin'
import user from '@/views/system/user/user'
import line from '@/views/system/line/line'
import hotel from '@/views/system/hotel/hotel'
import hotelItem from '@/views/system/hotel/hotelItem'
import forum from '@/views/system/forum/forum'
import comments from '@/views/system/comments/comments'
import order from '@/views/system/attractions/order'
import orderHotel from '@/views/system/hotel/order'
import rotations from '@/views/system/rotations/rotations'
import center from '@/views/system/center/center'
import error404 from '@/views/error/404'

Vue.use(VueRouter)

const routes = [
  {
    path: "",
    name: 'main',
    component: main,
    redirect: '/index',
    children: [
      {
        path: 'index',
        name: '首页',
        component: index
      },
      {
        path: 'attractions',
        name: '景点管理',
        component: attractions
      },
      {
        path: 'line',
        name: '线路管理',
        component: line
      },
      {
        path: 'hotel',
        name: '酒店管理',
        component: hotel
      },
      {
        path: 'hotelItem',
        name: '房型管理',
        component: hotelItem
      },
      {
        path: 'forum',
        name: '资讯管理',
        component: forum
      },
      {
        path: 'comments',
        name: '景点评论',
        component: comments
      },
      {
        path: 'order',
        name: '景点预约',
        component: order
      },
      {
        path: 'orderHotel',
        name: '酒店预约',
        component: orderHotel
      },
      {
        path: 'rotations',
        name: '轮播图管理',
        component: rotations
      },
      {
        path: 'admin',
        name: '管理员管理',
        component: admin
      },
      {
        path: 'user',
        name: '普通用户管理',
        component: user
      },
      {
        path: 'center',
        name: '个人中心',
        component: center
      }
    ]
  },
  {
    path: '/login',
    name: '登陆',
    component: login,
  },
  {
    path: '/404',
    name: '404',
    component: error404,
  }
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
  routes,
})

export default router
