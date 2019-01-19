<template>
  <div>
    <Flasher :colors="['red', 'green', 'blue']" :interval="interval" />
    <input :value="interval" @input="updateInterval($event)" />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import Flasher from './Flasher.vue';

@Component({
  components: {
    Flasher,
  },
})
export default class FlashSet extends Vue {
  private interval: number = 1000;

  private updateInterval($event: any) {
    this.interval = $event.target.value;
  }
}
</script>

<style>
</style>
