// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'
import { routes } from './router'
import App from './App'

import store from './store'
// import 'bootstrap/dist/css/bootstrap.css'
import ElementUI from 'element-ui' 
import 'element-ui/lib/theme-default/index.css'

import './assets/styles/base.css'
require('normalize.css')


Vue.config.devtools = true;

Vue.use(VueRouter)
Vue.use(VueResource)
Vue.use(ElementUI)

const router = new VueRouter({
  routes
});

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  ...App
});
