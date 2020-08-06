<template>
  <div v-bind:class = "((device.serial == alerts.serial) && (alerts.batteryIssues))?'batteryLow':'card'"> 
      <!--class="card" v-bind:class="{ 'batteryLow' : ( (device.serial === alerts.serial) && (alerts.batteryIssues) ) }"> -->
        <h3> Device Name: {{device.name}} </h3> 
        <h3> Serial: {{device.serial}} </h3> 
  </div>
</template>


<script>
//(device.serial == alerts.serial) && (alerts.batteryIssues)
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
.batteryLow {
    border: 2px solid black;
    border-radius: 10px;
    margin: 20px;
    width: 800px;
    text-align: center;
    background-color: rgb(250, 66, 66);
}
</style>