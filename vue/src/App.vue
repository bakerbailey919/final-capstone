<!-- Main Application Template. 
     Note that you have classes from bootstrap available to you.
     See https://getbootstrap.com/docs/4.0/components/alerts/ for reference on bootstrap -->

<template>
  <div id="app">
    <app-header />
    <div class="pageRoot">
      <router-view />
    </div>
  </div>
</template>

<script>
import AppHeader from "./components/AppHeader.vue";

export default {
  name: "App",

  components: {
    AppHeader,
  },
};
</script>

<!-- Application-Wide Styles go here 

INCLUDE HEALTH APPROVED COLORS

#E97A7A - Error
#41C0CB - Brand Teal
#2DACB7 - Web Teal
#F3F3F3 - Light Gray
#81888B - Gray
#444444 - Dark Gray
#1C1C1C - Almost Black

-->
<style>
body {
  background-color: #81888B;
  font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; 
}
img.logo-img {
  max-width: 100%;
  height: auto;
}
</style>