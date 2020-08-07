<template>
  <div class="card" v-bind:class="{ 'batteryLow' : (device.batteryLow), 'sensor' : (device.machineModelId == 2) }">
        <h3  v-if="device.inUse">
            <div class="circle"></div>
        </h3> 
        <h3 v-else>
            <div class="grayCircle"></div>
        </h3>
        <h3> Device Name: {{device.name}} </h3>
        <h3> Serial: {{device.serial}} </h3>
        <h3> Battery: {{device.batteryLevel}}% </h3> 
        <h3> Device Type: {{device.machineModelId}} </h3>
        <h3 v-if="device.inUse">Currently In Use</h3>
        <h3 v-else>Not In Use</h3>
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
      //alerts: []

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

      /*DeviceService.getAlerts()
      .then ( (response) => {
          this.alerts = response.data
      })
      .catch( (error) => {
          console.error(error);
      });
      */
  }
}
</script>

<style>
.card {
    border: 2px solid black;
    border-radius: 50px;
    margin: 20px;
    width: 500px;
    text-align: center;
    background-color: lightgreen;
}
.batteryLow {
    background-color: rgb(250, 66, 66);
}
.sensor {
    border-radius: 0px;
}
.circle {
    height: 20px;
    width: 20px;
    border-radius: 10px;
    background-color:green;
    margin-top: 8px;
    margin-left: 450px;
}
.grayCircle {
    height: 20px;
    width: 20px;
    border-radius: 10px;
    background-color: darkgray;
    margin-top: 8px;
    margin-left: 450px;
}
</style>