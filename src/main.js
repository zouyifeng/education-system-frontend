// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'

// import App from './App'
// import Login from './components/Login'
// import Home from './components/Home'

// 顶部
import Index from './components/Index'

// 首页
import Home from './components/index/home/Home'

// 师资力量
import TeacherInfo from './components/index/teacherInfo/TeacherInfo'

// 班级风采
import ClassInfo from './components/index/classInfo/ClassInfo'
import LiteratureInfo from './components/index/classInfo/LiteratureInfo'
import SportInfo from './components/index/classInfo/SportInfo'
import ActivityInfo from './components/index/classInfo/ActivityInfo'

import store from './store'
import TimeEntries from './components/TimeEntries'
import 'bootstrap/dist/css/bootstrap.css'

Vue.use(VueRouter)
Vue.use(VueResource)

const routes = [{
    path : '/index/home',
    component : Home
  },{
    path: '/index/classInfo',
    component: ClassInfo,
    children: [
      {
        path: 'sport',
        component: SportInfo
      },{
        path: 'Literature',
        component: LiteratureInfo
      },{
        path: 'activity',
        component: ActivityInfo
      }
    ]
  },{
    path: '/index/teacherInfo',
    component: TeacherInfo
  }

];


const router = new VueRouter({
  routes
});

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  ...Index
});
