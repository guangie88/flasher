<template>
  <div
    :class="{ flasher: true, fullscreen: isFullscreen }"
    v-on:dblclick="toggleFullscreen"
    :style="bgc">
    <div :class="{ unselectable: true, invisible: disableMsg }">{{ msg }}</div>
  </div>
</template>

<script lang="ts">
import NoSleep from '../tools/nosleep';

import { Component, Prop, Vue, Watch } from 'vue-property-decorator';

@Component
export default class Flasher extends Vue {
  @Prop()
  private colors!: string[];

  @Prop({ default: 200 })
  private interval!: number;

  @Prop({ default: '' })
  private msg!: string;

  @Prop({ default: false })
  private disableMsg!: boolean;

  private index: number = 0;
  private intervalId: number = -1;
  private isFullscreen: boolean = false;
  private ns: NoSleep = new NoSleep();

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

    // Disable sleeping
    if (this.isFullscreen) {
      this.ns.enable();
    } else {
      this.ns.disable();
    }
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
  min-height: 60px;
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
.unselectable {
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  -o-user-select:none;
  user-select: none;
}
.invisible {
  visibility: hidden;
}
</style>
