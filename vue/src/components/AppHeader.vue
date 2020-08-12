<template>
  <header>
    <nav class="navbar navbar-light fixed-top">
      <span class="navbar-brand mb-0 h1">
        <a class="navbar-brand" href="#">
          <router-link v-bind:to="{name: 'home'}">
            <img
              class="logo-img, d-inline-block align-top"
              src="../assets/images/Include_Health_logo_with_company_name.png"
              width="600"
              height="100"
              alt="Logo"
            />
          </router-link>
        </a>
        <router-link v-bind:to="{name: 'devices'}" exact>Devices</router-link>
        <router-link v-bind:to="{name: 'machineCheckins'}" exact>&nbsp;|&nbsp;Check-In Log</router-link>
        <router-link v-bind:to="{name: 'register'}" v-if="!$store.state.token">&nbsp;|&nbsp;Register</router-link>
        <router-link v-bind:to="{name: 'login'}" v-if="!$store.state.token">&nbsp;|&nbsp;Login</router-link>
        <router-link v-bind:to="{name: 'logout'}" v-if="$store.state.token">&nbsp;|&nbsp;Logout</router-link>
      </span>
    </nav>
  </header>
</template>

<script>
export default {
  name: "AppHeader",
  data() {
    return {};
  },
};
</script>

<style scoped>
header {
  height: 146px;
  color: #81888b;
  grid-area: navBar;
  text-align: center;
}
nav {
  border-bottom: 10px solid #2dacb7;
  background-color: #f3f3f3;
}
</style>