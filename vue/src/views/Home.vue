<template>
  <div class="home">
    <button type="button" class="btn btn-lg" @click="reloadPage()">Refresh</button>
    <device-list />
  </div>
</template>

<script>
import DeviceList from "../components/DeviceList.vue";

export default {
  name: "home",
  components: {
    DeviceList,
  },
  methods: {
    reloadPage() {
      window.location.reload();
    },
  },
};
</script>

<style>
.btn {
  background-color: #41c0cb;
  color: #ffffff;
  margin-top: 2rem;
  margin-left: 30rem;
  padding-top: 0.5rem;
  padding-right: 1.5rem;
  padding-bottom: 0.5rem;
  padding-left: 1.5rem;
}
</style>