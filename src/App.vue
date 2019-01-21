<template>
  <b-container id="app">
    <b-card title="Color Flasher">
      <FlashSet />
    </b-card>
  </b-container>
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
  padding-top: 20px;
}
</style>
