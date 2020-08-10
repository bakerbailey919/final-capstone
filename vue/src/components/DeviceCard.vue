<template>
  <div class="card" v-bind:class="{ 'batteryLow' : (device.batteryLow), 'sensor' : (device.machineModelId == 2), 'connectionLost' : (device.connectionLost) }">
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

        <button v-on:click="sendSerial()"> Maintenance Performed </button>
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
      

    };
  },
  created() {
  },
  methods: {
      sendSerial() {
          DeviceService.sendSerial(this.device.serial)
          .then ( () => {
               console.log("Maintenace Checkpoint Updated") 
          })
          .catch( (error) => {
          console.error(error);
      });
      }
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
.connectionLost {
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