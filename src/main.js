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

// 作文详情
import ClassActivityDetail from './components/index/home/ClassActivityDetail'

// 师资力量
import TeacherInfo from './components/index/teacherInfo/TeacherInfo'

// 班级风采
import ClassInfo from './components/index/classInfo/ClassInfo'
import LiteratureInfo from './components/index/classInfo/LiteratureInfo'
import SportInfo from './components/index/classInfo/SportInfo'
import ActivityInfo from './components/index/classInfo/ActivityInfo'

// 联系我们
import Contact from './components/index/contact/Contact'

// admin 
import Admin from './components/admin/Admin'
import Article from './components/admin/article/Article'
import EditArticle from './components/admin/article/EditArticle'
import Teacher from './components/admin/teacher/Teacher'
import EditTeacher from './components/admin/teacher/EditTeacher'
import Class from './components/admin/class/Class'
import EditClass from './components/admin/class/EditClass'

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
  },{
    path: '/index/contact',
    component: Contact
  },{
    path: '/index/classActivityDetail',
    component: ClassActivityDetail
  },{
    path: '/admin',
    component: Admin,
    children: [
      {
        path: 'article',
        component: Article
      },{
        path: 'editArticle',
        component: EditArticle
      },{
        path: 'teacher',
        component: Teacher
      },{
        path: 'editTeacher',
        component: EditTeacher
      },{
        path: 'class',
        component: Class
      },{
        path: 'editClass',
        component: EditClass
      }
    ]
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
