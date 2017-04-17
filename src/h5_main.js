// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'
import { routes } from './h5_router'
import store from './store'
import ElementUI from 'element-ui' 
import 'element-ui/lib/theme-default/index.css'

import './assets/styles/base.scss'
import h5 from './h5.vue'
require('normalize.css')
// require('vconsole')


Vue.config.devtools = true;

Vue.use(VueRouter)
Vue.use(VueResource)
Vue.use(ElementUI)

const router = new VueRouter({
  routes
});

/* eslint-disable no-new */
new Vue({
  el: '#h5',
  router,
  store,
  ...h5
});
