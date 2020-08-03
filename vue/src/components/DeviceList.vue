<template>
<div>
  <h2>Device List</h2>
      <p v-for="device in devices"
          v-bind:key="device.id"
          > {{device.id}}
          </p>
</div>
</template>

<script>
import DeviceService from '../services/DeviceService.js'

export default {
name: "device-list",
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

</style>