<template>
  <div class="home">
    <button @click = reloadPage()>Refresh</button>
      <device-list /> 
  </div>
</template>

<script>
import DeviceList from '../components/DeviceList.vue'


export default {
  name: "home",
  components: {
    DeviceList,
  },
methods: {
 reloadPage(){
    window.location.reload()
  }
}
};



</script>
