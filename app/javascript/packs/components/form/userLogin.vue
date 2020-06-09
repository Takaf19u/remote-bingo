<template>
  <form @submit.prevent="login">
      <h1>Log In</h1>
      <div class="inputBox">
        <label for="user_email"><p>メールアドレス</p></label>
        <input v-model="form.email" autofocus autocomplete="email" type="email" name="user[email]" id="user_email" />
      </div>

    <div class="inputBox passwordBox">
        <label for="user_password"><p>パスワード</p></label>
        <input v-model="form.password" autocomplete="new-password" type="password" name="user[password]" id="user_password" />
    </div>

    <div class="RememberBox">
      <input v-model="form.remember_me" name="user[remember_me]" type="hidden" value="0" />
      <input v-model="form.remember_me" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me" />
      <label for="user_remember_me">Remember me</label>
    </div>
    <div class="formbtn">
      <router-link to="/" class="formbtn--item">Back</router-link>
      <button type="submit" class="formbtn--item">Login</button>
    </div>

  </form>
</template>


<script>
import axios from "axios";

export default {
  data() {
    return {
      form: {
        email: "",
        password: "",
        remember_me: false,
      },
      labelView: [true, false, false]
    };
  },
  methods: {
    login() {
      axios.post(`/users/sign_in`, { user: this.form }).then(
        res => {
          window.location.href = "/main";
        },
        error => {
          console.log(error);
        }
      );
    }
  }
};
</script>


<style scoped lang="scss">

  h1 {
    color: rgb(197, 55, 253);
    text-shadow: 0 0 10px #fff, 0 0 10px #fff, 0 0 10px #fff, 0 0 40px rgb(199, 6, 199), 0 0 50px rgb(199, 6, 199), 0 0 60px rgb(199, 6, 199), 0 0 80px rgb(199, 6, 199);
  }

  .inputBox.passwordBox {
    margin-bottom: 10px;
  }

  .inputBox label {
    color: rgb(197, 55, 253);
  }
  .inputBox input {
    border: solid 2px rgb(197, 55, 253);
  }

  .RememberBox {
    color: rgb(237, 236, 238);
  }
</style>