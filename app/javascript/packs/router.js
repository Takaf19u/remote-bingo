import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import Top from './components/top.vue';
import CreateGroup from './components/createGroup.vue';
import UserForm from './components/form.vue';
import Main from './components/mainContents.vue';

Vue.use(VueRouter);

const router = new VueRouter({
  mode: 'history',
    routes: [
    { path: '/', component: Top },
    // { path: '/createGroup', component: CreateGroup },
    { path: '/createGroup', component: UserForm },
    { path: '/users/sign_up', component: UserForm },
    { path: '/users/sign_in', component: UserForm },
    { path: '/main', component: Main },
  ]
});

export default router;