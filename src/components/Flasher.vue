<template>
  <div class="flasher" :style="bgc"></div>
</template>

<script lang="ts">
import { Component, Prop, Vue, Watch } from 'vue-property-decorator';

@Component
export default class Flasher extends Vue {
  @Prop()
  private colors!: string[];

  @Prop({ default: 1000 })
  private interval!: number;

  private index: number = 0;
  private intervalId: number = -1;

  private bgc: { backgroundColor: string } = {
    backgroundColor: this.colors[0],
  };

  private mounted() {
    this.setNewInterval(this.interval);
  }

  @Watch('interval')
  private watchInterval(newInterval: number, oldInterval: number) {
    this.setNewInterval(newInterval);
  }

  private setNewInterval(newInterval: number) {
    if (this.intervalId !== -1) {
      clearInterval(this.intervalId);
    }

    this.intervalId = setInterval(() => {
      this.index = (this.index + 1) % this.colors.length;
      this.bgc.backgroundColor = this.colors[this.index];
    }, this.interval);
  }
}
</script>

<style scoped>
.flasher {
  width: 200px;
  height: 200px;
}
</style>
