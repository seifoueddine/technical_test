<template>
    <div>
      <h1>All Pokemons</h1>
      <ul>
        <li v-for="pokemon in pokemons" :key="pokemon.id">
          <router-link :to="`/pokemon/${pokemon.id}`">{{ pokemon.name }}</router-link>
        </li>
      </ul>
    </div>
  </template>
  
  <script>
  import { mapState } from 'vuex';
  
  export default {
    name: 'ListPokemons',
    computed: mapState(['pokemons']),
    created() {
      this.$store.dispatch('fetchPokemons');
    },
  };
  </script>
  
  <style scoped>
  /* Add your styles here */
  </style>
  