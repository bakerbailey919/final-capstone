<template>
  <div class="card">
        <h2> Device ID: {{device.deviceID}} </h2> 
        <h2> Device Type: {{device.deviceType}} </h2> 
        <h2> Device In Use: {{device.deviceInUse}} </h2> 
        <h2> Battery Percentage: {{device.batteryStatus}}% </h2> 
  </div>
</template>

<script>
import DeviceService from '../services/DeviceService.js'

export default {
    name: 'device-card',
    props: {
        device: Object
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
.card {
    border: 2px solid black;
    border-radius: 10px;
    margin: 20px;
    text-align: center;
}
</style>