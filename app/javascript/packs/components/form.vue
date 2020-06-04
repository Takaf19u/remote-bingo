<template>
  <div id="userForm">
    <transition mode="out-in" name="slide">
      <div v-bind:is="component"></div>
    </transition>
  </div>
</template>

<script>
import Login from "./user/userLogin.vue";
import New from "./user/userNew.vue";
import axios from "axios";

export default {
  components: {
    login: Login,
    new: New,
  },
  component: null,
  data: function() {
    return {
      componentTypes: ["login", "new"],
      current: 0,
    };
  },
  computed:{
    // 一致しているコンポーネント名を返す
    component: function(){
      this.changeComponent();
      return this.componentTypes[this.current]
    }
  },
  methods: {
    changeComponent() {
      let path = this.$router.currentRoute.path;
      if(path.match(/sign_in/)) {
        this.current = 0
      } else if(path.match(/sign_up/)) {
        this.current = 1
      };
    },
  }
};
</script>

<style scoped>
  form {
    color: white;
  }
</style>