// 首页
import Home from './components/index/home/Home'
import ClassActivityDetail from './components/index/home/NewsDetail'
import TeacherInfo from './components/index/teacherInfo/TeacherInfo'
import FileDownload from './components/index/fileDownload/FileDownload'
import Contact from './components/index/contact/Contact'

// 管理后台
import Admin from './components/admin/Admin'
import News from './components/admin/news/News'
import EditNews from './components/admin/news/EditNews'
import Teacher from './components/admin/teacher/Teacher'
import EditTeacher from './components/admin/teacher/EditTeacher'
import Student from './components/admin/student/Student'
import EditStudent from './components/admin/student/EditStudent'
import Classes from './components/admin/classes/Classes'
import EditClasses from './components/admin/classes/EditClasses'
import Message from './components/admin/message/Message'
import ClassActivity from './components/admin/classes/ClassActivity'
import Manager from './components/admin/manager/Manager'
import File from './components/admin/file/File'

 
export const routes = [{
    path : '/index/home',
    component : Home
  },{
    path: '/index/FileDownload',
    component: FileDownload
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
        name:'addNews',
        path: 'addNews',
        component: EditNews
      },{
        path: 'teacher',
        component: Teacher
      },{
        path: 'student',
        component: Student
      },{
        name: 'editStudent',
        path: 'editStudent/:id',
        component: EditStudent
      },{
        name: 'addStudent',
        path: 'addStudent',
        component: EditStudent
      },{
        name: 'classes',
        path: 'classes',
        component: Classes
      },{
        name: 'editClasses',
        path: 'editClasses',
        component: EditClasses
      },{
        name: 'classActivity',
        path: 'classActivity',
        component: ClassActivity
      },{
        name: 'message',
        path: 'message',
        component: Message
      },{
        name: 'manager',
        path: 'manager',
        component: Manager
      },{
        name: 'file',
        path: 'file',
        component: File
      }
    ]
  }
];

