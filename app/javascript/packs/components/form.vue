<template>
  <div id="userForm">
    <div class="bar" id="left-bar"></div>
    <div class="bar" id="right-bar"></div>
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

  .bar {
    height: 100%;
    width: 20px;
    background: linear-gradient(30deg, #bd6cff, #6cffeb, #e8f80c);
  }

  #left-bar {
    position: absolute;
      top: 0;
      bottom: 0;
      left: 5%;
  }

  #right-bar {
    position: absolute;
      top: 0;
      bottom: 0;
      right: 5%;
  }

  #left-bar::after {
    content: "";
    position: absolute;
      top: 0;
      bottom: 0;
      right: -20px;
      width: 10px;
      height: 100%;
    background: linear-gradient(30deg, #bd6cff, #6cffeb, #e8f80c);
  }

  #right-bar::after {
    content: "";
    position: absolute;
      top: 0;
      bottom: 0;
      left: -20px;
      width: 10px;
      height: 100%;
    background: linear-gradient(30deg, #bd6cff, #6cffeb, #e8f80c);
  }

  form {
    color: white;
  }
</style>