<template>
  <div class="card" style="width: 30rem;" 
    v-bind:class="{ 'batteryLow' : (device.batteryLow),
                    'connectionLost' : (device.connectionLost) }">

    
      <div class="flex-card-header-container">
        <img class="card-img-top" src="../assets/images/Include_Health_logo.png" alt="Card image cap" />
        <div class="card-body">
          <h5 class="card-title">{{device.name}}</h5>
          <p class="card-text">Serial: {{device.serial}}</p>
          <p class="card-text">Device Type: {{device.machineModelId}}</p>
        </div>
      </div>

      <ul class="list-group list-group-flush">
        <li class="list-group-item" v-if="device.connectionLost">CONNECTION LOST</li>
        <li class="list-group-item" v-else>Device currently online & paired</li>

        <li class="list-group-item"> Left Distance Since Maintenance: {{device.leftDistanceSinceMaintenance}}</li>
        <li class="list-group-item"> Right Distance Since Maintenance: {{device.rightDistanceSinceMaintenance}}</li>

        <li class="list-group-item"> Battery Level
            <div class="progress"> 
                <div class="progress-bar progress-bar-striped" 
                     role="progressbar" 
                     aria-valuenow ='' 
                     aria-valuemin="0" 
                     aria-valuemax="90"
                     v-bind:style = batteryPercentage  
                     >
                     {{Math.floor(device.batteryLevel)}}%
                </div>
            </div>
        </li>

        <li class="list-group-item" v-if="device.inUse">Currently In Use</li>
        <li class="list-group-item" v-else>Not In Use</li>

      </ul>

      <div class="card-body">
        <button class="maintenanceButton" v-on:click="sendSerial()">Maintenance Reset</button>
      </div>
  </div>
    <!--
    <div class="card" v-bind:class="{ 'batteryLow' : (device.batteryLow), 'sensor' : (device.machineModelId == 2), 'connectionLost' : (device.connectionLost) }">
        <h3  v-if="device.inUse">
            <div class="circle"></div>
        </h3> 
        <h4 v-else>
            <div class="grayCircle"></div>
        </h4>
        <h4> Device Name: {{device.name}} </h4>
        <h4> Serial: {{device.serial}} </h4>
        <h4 id="deviceType"> Device Type: {{device.machineModelId}} </h4>
         
        <h3 v-if="device.connectionLost"> MACHINE DOWN </h3>
        <h3 v-else> Machine currently online & paired</h3>
        <h3 v-if="device.inUse">Currently In Use</h3>
        <h3 v-else>Not In Use</h3>
        <h3> Battery: {{device.batteryLevel}}% </h3>
        <h3 v-if="device.batteryLow">Battery is Low</h3>
        <h3 v-else>Battery Good</h3>

            <p> Left Distance Since Maintenance: {{device.leftDistanceSinceMaintenance}} </p>
            <p> Right Distance Since Maintenance: {{device.rightDistanceSinceMaintenance}} </p>

        <button class="maintenanceButton" v-on:click="sendSerial()"> Maintenance Reset </button>
    </div>
    -->
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
    }
  },
  computed: {
    batteryPercentage() {
      return "width: " + Math.floor(this.device.batteryLevel) + "%"
    }
  }

};
</script>

<!-- 

INCLUDE HEALTH APPROVED COLORS

#E97A7A - Error
#41C0CB - Brand Teal
#2DACB7 - Web Teal
#F3F3F3 - Light Gray
#81888B - Gray
#444444 - Dark Gray
#1C1C1C - Almost Black

FROM LOGO
#A1CC3A - Light Green
-->

<style>
main{
  background-color: #444444;
}
.card {
  border: 4px solid #1C1C1C;
  border-radius: 25px;
  margin: 20px;
  text-align: center;
  background-color: #2DACB7;
}
.connectionLost {
  background-color: #E97A7A;
}
.sensor {
  border-radius: 25px;
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
  width: 10rem;
}
#deviceType{
  border-bottom: 2px solid #1C1C1C;
}

.list-group-item{
  margin: 10px;
  border: 10px solid #1C1C1C
}

img.card-img-top {
  width: 5rem;
}

div.progress{
  border: 2px solid #1C1C1C;
  border-radius: .5rem;
  height: 1.5rem;
}

div.progress-bar.progress-bar-striped{
  background-color: #A1CC3A; 
}

.flex-card-header-container {
  display: flex;
  align-items: center;
  margin-left: 2.5rem;
}

</style>