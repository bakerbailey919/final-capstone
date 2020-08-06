<template>
  <div class="card">
        <h3> Device Name: {{device.name}} </h3> 
        <h3> Serial: {{device.serial}} </h3> 
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
      alerts: []
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

      DeviceService.getAlerts()
      .then ( (response) => {
          this.alerts = response.data
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
    width: 800px;
    text-align: center;
    background-color: lightgreen;
}
</style>