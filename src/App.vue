<template>
  <div id="app">
    <FlashSet />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import FlashSet from './components/FlashSet.vue';

@Component({
  components: {
    FlashSet,
  },
})
export default class App extends Vue {}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
