<template>
    <div>
      <h1>Add Money</h1>
      <form @submit.prevent="addMoney">
        <div>
          <label for="amount">Amount:</label>
          <input type="number" v-model="amount" />
        </div>
        <button type="submit">Add</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    name: 'AddMoney',
    data() {
      return {
        amount: 0,
      };
    },
    methods: {
      async addMoney() {
        try {
          await this.$store.dispatch('addMoney', this.amount);
          this.$router.push('/me');
        } catch (error) {
          alert('Failed to add money');
        }
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add your styles here */
  </style>
  