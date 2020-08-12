<template>
<div>
  <h2>Device List</h2>
      <p v-for="device in orderedDevices"
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

      
    }
  }
}
</script>

<style>
#card-container{
  display: inline-block;
}
h2{
  text-align: center;
  margin-right: 100px;
}
</style>