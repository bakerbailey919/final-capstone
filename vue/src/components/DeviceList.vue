<template>
<div>
  <select id="orgFilter" v-model="filter.status">
              <option value>Organization - Show All</option>
              <option value="Organization 1">Organization 1</option>
              <option value="Organization 2">Organization 2</option>
              <option value="Organization 3">Organization 3</option>
              <option value="Organization 4">Organization 4</option>
              <option value="Organization 5">Organization 5</option>
  </select>
  <select id="connectionFilter" v-model="filter.connectionStatus">
              <option value>Connection Status - Show All</option>
              <option v-bind:value="true">Connection Lost</option>
  </select>

  <h1>Device List</h1>
        
      <p v-for="device in filteredDevices"
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
      filter: {
        status: "",
        connectionStatus: ""
      }
      
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


  },
  computed: {
    orderedDevices(){
      // eslint-disable-next-line vue/no-side-effects-in-computed-properties
      return this.devices.sort( (device1, device2) => {
        console.log(device1, device2)
        //if (device1.connectionLost && !device2.connectionLost) return 1; // Use device 1
        //if (device2.connectionLost && !device2.connectionLost) return -1; // Use device 2

        if (device1.batteryLow && !device2.batteryLow) return 1; // Use device 1
        else if (device2.batteryLow && !device2.batteryLow) return -1; // Use device 2

        return 1;

      }) 
    },
    filteredDevices() 
    {
      let filteredDevices = this.devices;

      if (this.filter.status != "") 
      {
        filteredDevices = filteredDevices.filter( (device) =>
          device.organization === this.filter.status);
      }
      if (this.filter.connectionStatus == true){

        console.log(this.device, this.filter);

        filteredDevices = filteredDevices.filter( (device) => 
          device.connectionLost == this.filter.connectionStatus);
      }
      return filteredDevices;
    }
  }
}
</script>

<style>
#card-container{
  display: inline-block;
}
h1{
  text-align: center;
  margin-right: 100px;
  font-size: 5rem;
}
</style>