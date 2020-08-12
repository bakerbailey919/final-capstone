<template>
  <footer>
      <img
            class="logo-img, d-inline-block align-top"
            src="../assets/images/Include_Health_logo_with_company_name.png"
            width="300"
            height="50"
            alt="Logo"
          />
     <h5 class="title">All Rights Reserved 2020</h5>
  </footer>
</template>

<script>
export default {
  name: "AppFooter",
  data() {
    return {};
  },
};
</script>

<style scoped>
footer {
  height: 86px;
  background-color:  #f3f3f3;
  grid-area: navBar;
  text-align: center;
border-top: 10px solid #2dacb7;
box-shadow: 0 50vh 0 50vh #f3f3f3;
   
}
img {
padding-top: 5px;
}


</style>