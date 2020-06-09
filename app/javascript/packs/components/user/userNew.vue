<template>
    <form @submit.prevent="createUser">
      <h1>Sign Up</h1>
      <div class="inputBox">
        <label for="user_name"><p>ニックネーム</p></label>
        <input v-model="form.name" autofocus type="text" name="user[name]" id="user_name" placeholder="３文字以上" minlength="3" />
      </div>

      <div class="inputBox">
        <label for="user_email"><p>メールアドレス</p></label>
        <input v-model="form.email" autocomplete="email" type="email" name="user[email]" id="user_email" placeholder="@必須" />
      </div>

      <div class="inputBox">
        <label for="user_password"><p>パスワード</p></label>
        <input v-model="form.password" autocomplete="new-password" type="password" name="user[password]" id="user_password" placeholder="6文字以上" minlength="6"  />
      </div>
      <div class="inputBox">
        <label for="user_password_confirmation"><p>パスワード確認</p></label>
        <input v-model="form.password_confirmation" autocomplete="new-password" type="password" name="user[password_confirmation]" id="user_password_confirmation" />
      </div>
      <div class="formbtn">
        <router-link to="/main" class="formbtn--item">Back</router-link>
        <button type="submit" class="formbtn--item">Create</button>
      </div>
    </form>
</template>


<script>
import axios from "axios";

export default {
  data() {
    return {
      form: {
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
      },
      labelView: [ true, false, false ],
    }
  },
  methods: {
      createUser() {
          axios.post(`/users`,{ user: this.form }).then((res) => {
            debugger
            window.location.href = "/main";
          }, (error) => {
            console.log(error);
          });
      },
  }
};
</script>


<style scoped lang="scss">
  h1 {
    color: rgb(0, 132, 255);
    text-shadow: 0 0 10px #fff, 0 0 10px #fff, 0 0 10px #fff, 0 0 40px rgb(17, 180, 255), 0 0 50px rgb(17, 160, 255), 0 0 60px rgb(18, 124, 245), 0 0 80px rgb(18, 124, 245);
  }
</style>