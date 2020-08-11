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
        <h3 v-if="device.connectionLost"> MACHINE DOWN </h3>
        <p v-else> Machine currently online & paired</p>
        <h3 v-if="device.inUse">Currently In Use</h3>
        <h3 v-else>Not In Use</h3>
        <h3 v-if="device.batteryLow">Battery is Low</h3>
        <h3 v-else>Battery Good</h3>

            <p> Left Distance Since Maintenance: {{device.leftDistanceSinceMaintenance}} </p>
            <p> Right Distance Since Maintenance: {{device.rightDistanceSinceMaintenance}} </p>

        <button class="maintenanceButton" v-on:click="sendSerial()"> Maintenance Reset </button>
    </div>
</template>


<script>
import DeviceService from "../services/DeviceService.js";

export default {
  name: "device-card",
  props: {
    device: Object,
  },
  data() {
    return {};
  },
  created() {},
  methods: {
    sendSerial() {
      DeviceService.sendSerial(this.device.serial)
        .then(() => {
          console.log("Maintenace Checkpoint Updated");
          window.location.reload();
        })
        .catch((error) => {
          console.error(error);
        });
    },
  
  },
};
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
  background-color: lightsalmon;
}
.connectionLost {
  background-color: #E97A7A;
}
.sensor {
  border-radius: 0px;
}
.circle {
  height: 20px;
  width: 20px;
  border-radius: 10px;
  background-color: green;
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
.maintenanceButton {
  width: 150px;
  margin-left: 175px;
}
</style>