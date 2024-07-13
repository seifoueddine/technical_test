<template>
  <div>
    <h1>User Login</h1>
    <form @submit.prevent="login">
      <input type="email" v-model="email" placeholder="Email" required>
      <input type="password" v-model="password" placeholder="Password" required>
      <button type="submit">Login</button>
    </form>
    <div v-if="error" class="error">{{ error }}</div>
  </div>
</template>

<script>
export default {
  name: 'UserLogin',
  data() {
    return {
      email: '',
      password: '',
      error: null,
    };
  },
  methods: {
    async login() {
      try {
        const response = await fetch('http://localhost:3000/users/sign_in', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            user: {
              email: this.email,
              password: this.password,
            },
          }),
          credentials: 'include',
        });
        if (!response.ok) {
          throw new Error(`An error occurred: ${response.statusText}`);
        }
        const data = await response.json();
        localStorage.setItem('auth_token', data.token);
        this.$router.push('/me');
      } catch (error) {
        this.error = error.message;
      }
    },
  },
};
</script>

<style scoped>
.error {
  color: red;
}
</style>
