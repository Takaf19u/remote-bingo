import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import Top from './components/top.vue';

Vue.use(VueRouter);

const router = new VueRouter({
  mode: 'history',
    routes: [
    { path: '/', component: Top },
  ]
});

export default router;