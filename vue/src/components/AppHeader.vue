<template>
  <header>
    <nav class="navbar navbar-light fixed-top">
      <!-- <span class="navbar-brand mb-0 h1"> -->
        <router-link v-bind:to="{name: 'home'}" class="navbar-brand" href="#">
          <img
            class="logo-img, d-inline-block align-top"
            src="../assets/images/Include_Health_logo_with_company_name.png"
            width="300"
            height="50"
            alt="Logo"
          />
        </router-link>
        <div class="nav-buttons">
          <router-link v-bind:to="{name: 'home'}" exact>Devices</router-link>
          <router-link v-bind:to="{name: 'machineCheckins'}" exact>&nbsp;|&nbsp;Check-In Log</router-link>
          <router-link
            v-bind:to="{name: 'register'}"
            v-if="!$store.state.token"
          >&nbsp;|&nbsp;Register</router-link>
          <router-link v-bind:to="{name: 'login'}" v-if="!$store.state.token">&nbsp;|&nbsp;Login</router-link>
          <router-link v-bind:to="{name: 'logout'}" v-if="$store.state.token">&nbsp;|&nbsp;Logout</router-link>
        </div>
      <!-- </span> -->
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
  height: 86px;
  color: #81888b;
  grid-area: navBar;
  text-align: center;
}
nav {
  border-bottom: 10px solid #2dacb7;
  background-color: #f3f3f3;
}
.nav-buttons {
  display: flex;
  justify-content: flex-end;
  flex-direction: row;
  align-items: center;
}
</style>