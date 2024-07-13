// src/router/index.js
import { createRouter, createWebHistory } from 'vue-router';
import LandingPage from '../components/LandingPage.vue';
import ListPokemons from '../components/ListPokemons.vue';
import ShowPokemon from '../components/ShowPokemon.vue';
import AppCheckout from '../components/Checkout.vue';
import AppLogin from '../components/Login.vue';
import AppRegister from '../components/Register.vue';
import UserAccount from '../components/UserAccount.vue';
import AddMoney from '../components/AddMoney.vue';
import AppTransactions from '../components/Transactions.vue';

const routes = [
  { path: '/', component: LandingPage },
  { path: '/pokemon', component: ListPokemons },
  { path: '/pokemon/:id', component: ShowPokemon },
  { path: '/pokemon/:id/checkout', component: AppCheckout },
  { path: '/login', component: AppLogin },
  { path: '/register', component: AppRegister },
  { path: '/me', component: UserAccount },
  { path: '/me/add', component: AddMoney },
  { path: '/me/transactions', component: AppTransactions },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
