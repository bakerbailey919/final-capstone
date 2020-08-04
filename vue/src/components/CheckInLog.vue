<template>
<div class="checkIns">
    <h2>Machine Log Check In Details</h2>

</div>
  
</template>

<script>
import DeviceService from "../services/DeviceService.js";

export default {
    name: "machine-check-ins",
    props: {
        checkIn: Object
    },
    data() {
    return {
      checkIns: [],
    };
  },
  created() {
      DeviceService.getMachineCheckIns()
      .then( (response) => {
          this.checkIns = response.data
      })
      .catch( (error) => {
          console.error(error);
      });
  },
}
</script>

<style>

</style>