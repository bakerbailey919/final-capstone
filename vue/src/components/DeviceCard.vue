<template>
  <div class="card" style="width: 25rem;" >
      <div class="flex-card-header-container">
        <img class="card-img-top" src="../assets/images/Include_Health_logo.png" alt="Card image cap" />
        <div class="card-body">
          <h5 class="card-title">{{device.name}}</h5>
          <p class="card-text">Serial: {{device.serial}}</p>
          <p class="card-text">Device Type: {{device.machineModelId}}</p>
        </div>
      </div>

      <ul class="list-group list-group-flush">
        
        <li class="list-group-item" id="connection-bad" v-if="device.connectionLost">CONNECTION LOST</li>
        <li class="list-group-item" id="connection-good" v-else>DEVICE ONLINE & PAIRED</li>

        <li class="list-group-item"> Left Distance Since Maintenance: {{device.leftDistanceSinceMaintenance}}</li>
        <li class="list-group-item"> Right Distance Since Maintenance: {{device.rightDistanceSinceMaintenance}}</li>

        <li class="list-group-item"> Battery Level
            <div class="progress"> 
                <div class="progress-bar progress-bar-striped" 
                v-bind:class="{'progress-bar progress-bar-striped batteryLow':(device.batteryLow)}" 
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

.card {
  border: 5px solid #1C1C1C;
  border-radius: 25px;
  margin: 20px;
  text-align: center;
  background-color: #81888B;
}
.connectionLost {
  background-color: #81888B;
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
.list-group-item{
  margin: 11px;
  border: 10px solid #1C1C1C;
  border-radius: 1rem!important;
}
#connection-bad {
  background-color: #E97A7A;
}
#connection-good {
  background-color: #A1CC3A;
}
.progress-bar.progress-bar-striped.batteryLow{
  background-color: #E97A7A;
}

</style>