<template>
  <div
    :class="{ flasher: true, fullscreen: isFullscreen }"
    v-on:click="toggleFullscreen"
    :style="bgc">
    <div>{{ msg }}</div>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue, Watch } from 'vue-property-decorator';

@Component
export default class Flasher extends Vue {
  @Prop()
  private colors!: string[];

  @Prop({ default: 250 })
  private interval!: number;

  @Prop({ default: '' })
  private msg!: string;

  private index: number = 0;
  private intervalId: number = -1;
  private isFullscreen: boolean = false;

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

  private toggleFullscreen() {
    this.isFullscreen = !this.isFullscreen;
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
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
}
.fullscreen {
  top: 0;
  left: 0;
  position: fixed;
  z-index: 99999;
}
</style>
