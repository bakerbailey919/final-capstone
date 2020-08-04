<template>
  <div class="home">
    <h1>Home</h1>
    <nav>
      <router-link v-bind:to="{name: 'machineCheckins'}">Machine Check In Log</router-link>
    </nav>
      <device-list /> 
  </div>
</template>

<script>
import DeviceList from '../components/DeviceList.vue'


export default {
  name: "home",
  components: {
    DeviceList,
  }
};
</script>
