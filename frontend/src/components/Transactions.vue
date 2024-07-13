<template>
    <div>
      <h1>My Transactions</h1>
      <ul>
        <li v-for="transaction in transactions" :key="transaction.id">
          {{ transaction.action }}: {{ transaction.pokemon.name }} - ${{ transaction.amount }}
        </li>
      </ul>
    </div>
  </template>
  
  <script>
  import { mapState } from 'vuex';
  
  export default {
    name: 'AppTransactions',
    computed: mapState(['transactions']),
    created() {
      this.$store.dispatch('fetchTransactions');
    },
  };
  </script>
  
  <style scoped>
  /* Add your styles here */
  </style>
  