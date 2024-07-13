<template>
    <div>
      <h1>{{ pokemon.name }}</h1>
      <p><strong>Weight:</strong> {{ pokemon.weight }} kg</p>
      <p><strong>Height:</strong> {{ pokemon.height }} cm</p>
      <p><strong>Price:</strong>  {{ pokemon.price }} USD_BTC</p>
      <p v-if="pokemon.user">
        <strong>Owner:</strong> {{ pokemon.user.email }} (ID: {{ pokemon.user.id }})
      </p>
      <router-link :to="`/pokemon/${pokemon.id}/checkout`">Buy</router-link>
      <div v-if="error" class="error">{{ error }}</div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'ShowPokemon',
    data() {
      return {
        pokemon: {},
        error: null,
      };
    },
    created() {
      const id = this.$route.params.id;
      this.fetchPokemon(id);
    },
    methods: {
      async fetchPokemon(id) {
        try {
          const response = await fetch(`http://localhost:3000/pokemons/${id}`);
          if (!response.ok) {
            throw new Error(`An error occurred: ${response.statusText}`);
          }
          this.pokemon = await response.json();
        } catch (error) {
          this.error = error.message;
        }
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add your styles here */
  img {
    max-width: 100%;
    height: auto;
  }
  .error {
    color: red;
  }
  </style>
  