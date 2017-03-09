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
import News from './components/admin/news/News'
import EditNews from './components/admin/news/EditNews'
import Teacher from './components/admin/teacher/Teacher'
import EditTeacher from './components/admin/teacher/EditTeacher'
import Student from './components/admin/student/Student'
import EditStudent from './components/admin/student/EditStudent'
import Classes from './components/admin/classes/Classes'
import EditClasses from './components/admin/classes/EditClasses'

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
        path: 'news',
        component: News
      },{
        name:'editNews',
        path: 'editNews/:id',
        component: EditNews
      },{
        name:'editNews',
        path: 'editNews',
        component: EditNews
      },{
        path: 'teacher',
        component: Teacher
      },{
        name: 'editTeacher',
        path: 'editTeacher/:id',
        component: EditTeacher
      },{
        name: 'editTeacher',
        path: 'editTeacher',
        component: EditTeacher
      },{
        path: 'student',
        component: Student
      },{
        name: 'editStudent',
        path: 'editStudent/:id',
        component: EditStudent
      },{
        name: 'editStudent',
        path: 'editStudent',
        component: EditStudent
      },{
        name: 'classes',
        path: 'classes',
        component: Classes
      },{
        name: 'editClasses',
        path: 'editClasses',
        component: EditClasses
      }
    ]
  }
];

