
import { createStore } from 'vuex';
import axios from 'axios';

const store = createStore({
  state: {
    user: null,
    token: null,
    pokemons: [],
    transactions: [],
  },
  mutations: {
    SET_USER(state, user) {
      state.user = user;
    },
    SET_TOKEN(state, token) {
      state.token = token;
    },
    SET_POKEMONS(state, pokemons) {
      state.pokemons = pokemons;
    },
    SET_TRANSACTIONS(state, transactions) {
      state.transactions = transactions;
    },
  },
  actions: {
    async login({ commit }, credentials) {
      const response = await axios.post('http://localhost:3000/users/sign_in', credentials);
      commit('SET_USER', response.data.user);
      commit('SET_TOKEN', response.data.token);
    },
    async register({ commit }, credentials) {
      const response = await axios.post('http://localhost:3000/users', credentials);
      commit('SET_USER', response.data.user);
      commit('SET_TOKEN', response.data.token);
    },
    async fetchPokemons({ commit }) {
      const response = await axios.get('http://localhost:3000/pokemons');
      commit('SET_POKEMONS', response.data);
    },
    async fetchTransactions({ commit }) {
      const response = await axios.get('http://localhost:3000/me/transactions');
      commit('SET_TRANSACTIONS', response.data);
    },
    async addMoney({ commit, state }, amount) {
      const response = await axios.patch('http://localhost:3000/me/add', { amount }, {
        headers: { Authorization: `Bearer ${state.token}` }
      });
      commit('SET_USER', response.data.user);
    },
  },
  getters: {
    isAuthenticated(state) {
      return !!state.token;
    },
    getUser(state) {
      return state.user;
    },
    getPokemons(state) {
      return state.pokemons;
    },
    getTransactions(state) {
      return state.transactions;
    },
  },
});

export default store;
