import Schedule from './components/admin/classes/LessonSchedule'

// 微信端
import H5StudentIndex from './components/h5/H5StudentIndex'
import H5TeacherIndex from './components/h5/H5TeacherIndex'
import UserLogin from './components/h5/UserLogin'
import H5Apply from './components/h5/H5Apply.vue'

export const routes = [{
  name: H5StudentIndex,
  path: '/h5StudentIndex',
  component: H5StudentIndex,
    children: [{
        path: 'schedule/:id',
        component: Schedule
      }]
  },{
  name: H5StudentIndex,
  path: '/h5StudentIndex/:id',
  component: H5StudentIndex,
    children: [{
        path: 'schedule/:id',
        component: Schedule
      }]
  }, {
    name: H5TeacherIndex,
    path: '/h5TeacherIndex',
    component: H5TeacherIndex,
    children: [{
        path: 'schedule/:id',
        component: Schedule
      }]
  },{
  name: H5TeacherIndex,
  path: '/h5TeacherIndex/:id',
  component: H5TeacherIndex,
    children: [{
        path: 'schedule/:id',
        component: Schedule
      }]
  }, {
    name: UserLogin,
    path: '/userLogin',
    component: UserLogin
  },{
    name: H5Apply,
    path: '/h5Apply',
    component: H5Apply
  }
];

