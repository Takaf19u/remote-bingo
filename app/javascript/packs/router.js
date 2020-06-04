import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import Top from './components/top.vue';
import CreateGroup from './components/createGroup.vue';
import UserNew from './components/user/userNew.vue';

Vue.use(VueRouter);

const router = new VueRouter({
  mode: 'history',
    routes: [
    { path: '/', component: Top },
    { path: '/createGroup', component: CreateGroup },
    { path: '/users/sign_up', component: UserNew },
  ]
});

export default router;