<template>
  <div class="home">
    <h1>Home</h1>
    <button @click = reloadPage()>Refresh</button>
    <nav>
      
    </nav>
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
