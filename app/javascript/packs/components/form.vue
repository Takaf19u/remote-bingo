<template>
  <div id="userForm">
    <div class="bar" id="left-bar"></div>
    <div class="bar" id="right-bar"></div>
    <div id="changeForm">
      <transition mode="out-in" name="slide">
        <div v-bind:is="component"></div>
      </transition>
    </div>
  </div>
</template>

<script>
import Login from "./form/userLogin.vue";
import New from "./form/userNew.vue";
import CreateGroup from "./form/createGroup.vue";
import axios from "axios";

export default {
  components: {
    login: Login,
    new: New,
    createGroup: CreateGroup
  },
  component: null,
  data: function() {
    return {
      componentTypes: ["login", "new", "createGroup"],
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
      } else if(path.match(/createGroup/)) {
        this.current = 2
      };
    },
  }
};
</script>

<style scoped lang="scss">
  #userForm {
    height: 100%;
    overflow: scroll;
  }

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
    height: 100%;
  }

  #right-bar {
    position: absolute;
      top: 0;
      bottom: 0;
      right: 5%;
    height: 100%;
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

  #changeForm {
    width: 450px;
    height: 100%;
    margin: 0 auto;
    padding-top: 5vh;
  }
  
  /deep/ form {
    & h1 {
      font-family: 'Monoton', cursive;
      font-size: 3.5em;
      text-align: center;
      margin-bottom: 50px;
      font-weight: 600;
    }
    .inputBox {
      width: 100%;
      margin-bottom: 8vh;
      position: relative;
      & label {
        position: absolute;
          top: -15px;
          left: 5px;
        font-size: 1em;
        background: black;
        padding: 0 2px;
      }
      & input {
        width: 100%;
        padding: 5px 8px;
        color: white;
        font-size: 2.8vh;
        font-weight: 200;
        border-radius: 5px;
        outline: none;
        background-color: transparent;
        box-shadow: 0px 0px 0px 1px rgb(129, 128, 128);
        /* placeholderの色 */
        &::placeholder {
          font-size: 0.7em;
          color: rgba(177, 175, 175, 0.897);
        }
        /* IE */
        &:-ms-input-placeholder {
          font-size: 0.7em;
          color: rgba(177, 175, 175, 0.897);
        }
        /* Edge */
        &::-ms-input-placeholder {
          font-size: 0.7em;
          color: rgba(177, 175, 175, 0.897);
        }
        &:-webkit-autofill {
          animation-name: onAutoFillStart;
          transition: background-color 50000s ease-in-out 0s;
          -webkit-text-fill-color: white !important;
        }
      }
    }
    & .formbtn {
      width: 100%;
      margin: 8vh auto 0;
      display: flex;
      justify-content: center;
      padding: 0 10px;
      &--item {
        margin: 0 30px;
        font-family: 'Montserrat', sans-serif;
        text-decoration: none;
        font-size: 1.6em;
        font-weight: 200;
        display: inline-block;
        background: #f36f6fb9;
        color: rgb(194, 194, 194);
        width: 100px;
        height: 100px;
        line-height: 100px;
        border-radius: 50%;
        text-align: center;
        overflow: hidden;
        box-shadow: 0px 2px 5px rgba(202, 248, 250, 0.59);
        border-bottom: solid 3px #bd6565;
        transition: .2s;
          -webkit-appearance: none;
          -moz-appearance: none;
          appearance: none;
          padding: 0;
          border: none;
          outline: none;
        &:hover {
          background: #fa8b8b;
          color: white;
        }
        &:active {
          -webkit-transform: translateY(2px);
          transform: translateY(2px);
          box-shadow: 0 0 1px rgba(163, 231, 252, 0.5);
          border-bottom: none;
        }
      }
    }
  }

  @keyframes onAutoFillStart { from {} to {}}


</style>