<template>
    <div>
      <h1>Checkout</h1>
      <p>Are you sure you want to buy {{ pokemon.name }}?</p>
      <button @click="buyPokemon">Buy</button>
    </div>
  </template>
  
  <script>
  export default {
    name: 'AppCheckout',
    data() {
      return {
        pokemon: {},
      };
    },
    created() {
      const id = this.$route.params.id;
      this.fetchPokemon(id);
    },
    methods: {
      async fetchPokemon(id) {
        const response = await fetch(`http://localhost:3000/pokemons/${id}`);
        this.pokemon = await response.json();
      },
      async buyPokemon() {
        const response = await fetch(`http://localhost:3000/pokemons/${this.pokemon.id}/buy`, {
          method: 'POST',
          headers: {
            Authorization: `Bearer ${this.$store.state.token}`,
          },
        });
        const result = await response.json();
        if (result.success) {
          this.$router.push('/me');
        } else {
          alert(result.message);
        }
      },
    },
  };
  </script>
  
  <style scoped>
  /* Add your styles here */
  </style>
  