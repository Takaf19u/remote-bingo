<template>
  <form @submit.prevent="login">
      <div class="field">
        <label for="user_email">Email</label>
        <br />
        <input v-model="form.email" autofocus autocomplete="email" type="email" name="user[email]" id="user_email" />
      </div>

      <div class="field">
        <label for="user_password">Password</label>
        <em>(6 characters minimum)</em>
        <br />
        <input v-model="form.password" autocomplete="new-password" type="password" name="user[password]" id="user_password" />
      </div>

    <div class="field">
      <!-- <input v-model="form.remember_me" name="user[remember_me]" type="hidden" value="0" /> -->
      <input v-model="form.remember_me" type="checkbox" value="1" name="user[remember_me]" id="user_remember_me" />
      <label for="user_remember_me">Remember me</label>
    </div>
      <div class="actions">
        <button type="submit">送信</button>
      </div>
  </form>
</template>


<script>
import axios from "axios";

export default {
  data() {
    return {
      form: {
        name: "",
        email: "",
        password: "",
        remember_me: false,
      },
      labelView: [true, false, false]
    };
  },
  methods: {
    login() {
      console.log(this.form);
      axios.post(`/users/sign_in`, { user: this.form }).then(
        res => {
          window.location.href = "/";
        },
        error => {
          console.log(error);
        }
      );
    }
  }
};
</script>


<style scoped>
#userForm {
  color: white;
}
</style>