<template>
    <div>
      <h1>Register</h1>
      <form @submit.prevent="register">
        <div>
          <label for="email">Emaidl:</label>
          <input type="email" v-model="email" />
        </div>
        <div>
          <label for="password">Password:</label>
          <input type="password" v-model="password" />
        </div>
        <div>
          <label for="password_confirmation">Confirm Password:</label>
          <input type="password" v-model="passwordConfirmation" />
        </div>
        <button type="submit">Register</button>
        <div v-if="errors.length">
          <p>Please correct the following error(s):</p>
          <ul>
            <li v-for="error in errors" :key="error">{{ error }}</li>
          </ul>
        </div>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    name: 'AppRegister',
    data() {
      return {
        email: '',
        password: '',
        passwordConfirmation: '',
        errors: []
      };
    },
    methods: {
      async register() {
        try {
          await this.$store.dispatch('register', {
            user: {
              email: this.email,
              password: this.password,
              password_confirmation: this.passwordConfirmation
            }
          });
          this.$router.push('/me');
        } catch (error) {
          if (error.response && error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          } else {
            this.errors = ['An unknown error occurred.'];
          }
        }
      }
    }
  };
  </script>
  
  <style scoped>
  /* Add your styles here */
  </style>
  