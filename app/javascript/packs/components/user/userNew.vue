<template>
  <div id="userForm">
    <form @submit.prevent="createUser">
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
        <label for="user_password_confirmation">Password confirmation</label>
        <br />
        <input v-model="form.password_confirmation" autocomplete="new-password" type="password" name="user[password_confirmation]" id="user_password_confirmation" />
      </div>
      <div class="actions">
        <button type="submit">送信</button>
      </div>
    </form>
  </div>
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
          debugger
          axios.post(`/users`,{ user: this.form }).then((res) => {
            window.location.href = "/";
          }, (error) => {
            console.log(error);
          });
      },
  }
};
</script>


<style scoped>
  #userForm {
    color: white;
  }
</style>