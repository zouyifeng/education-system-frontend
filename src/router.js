// 首页
import Home from './components/index/home/Home'

// 作文详情
import ClassActivityDetail from './components/index/home/NewsDetail'

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
import Article from './components/admin/news/News'
import EditArticle from './components/admin/news/EditNews'
import Teacher from './components/admin/teacher/Teacher'
import EditTeacher from './components/admin/teacher/EditTeacher'
import Class from './components/admin/class/Class'
import EditClass from './components/admin/class/EditClass'

export const routes = [{
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
    name: 'classActivityDetail',
    path: '/index/classActivityDetail/:id',
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

