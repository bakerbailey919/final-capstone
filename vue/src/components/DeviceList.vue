<template>
<div>
  <h2>Device List</h2>
      <p v-for="device in devices"
         v-bind:key="device.id" id="card-container">
            <device-card v-bind:device="device" />      
      </p>
</div>
</template>

<script>
import DeviceService from '../services/DeviceService.js'
import DeviceCard from '../components/DeviceCard.vue'

export default {
  name: "device-list",
  components : {
    DeviceCard
  },
  data() {
    return {
      devices: [],
    };
  },
  created() {
      DeviceService.getDevices()
      .then( (response) => {
          this.devices = response.data
      })
      .catch( (error) => {
          console.error(error);
      });

  }
}
</script>

<style>
#card-container{
  display: inline-block;
}
</style>