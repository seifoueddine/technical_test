<template>
    <div>
      <h1>User Account</h1>
      <div v-if="user">
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Balance:</strong> {{ user.balance }}</p>
      </div>
      <div v-else>
        <p>Loading user data...</p>
      </div>
      <div v-if="error" class="error">{{ error }}</div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'UserAccount',
    data() {
      return {
        user: null,
        error: null,
      };
    },
    created() {
      this.fetchUser();
    },
    methods: {
      async fetchUser() {
        try {
          const token = localStorage.getItem('auth_token');
          const response = await fetch('http://localhost:3000/me', {
            headers: {
              'Authorization': `Bearer ${token}`,
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'credentials': 'include',
            },
          });
          if (!response.ok) {
            throw new Error(`An error occurred: ${response.statusText}`);
          }
          this.user = await response.json();
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
  