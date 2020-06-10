import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import Top from './components/top.vue';
import UserForm from './components/form.vue';
import Main from './components/mainContents.vue';
import Group from './components/bingo/group.vue';

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
    { path: '/createGroup/:id', component: Group },
  ]
});

export default router;