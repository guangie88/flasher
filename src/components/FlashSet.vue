<template>
  <b-container class="enclosed">
    <b-row>
      <b-col sm="8">
        <Flasher :colors="colors" :interval="interval" msg="Click to toggle fullscreen" />
      </b-col>
      <b-col sm="4">
        <b-row>
          <div>
            <label style="" for="interval">Interval (ms):</label>
            <input id="interval" :value="interval" @input="updateInterval($event)" />
          </div>
        </b-row>
        <b-row>
          <div>
            <label style="margin-right: 10px;" for="colors">Color(s):</label>
            <input id="colors" :value="colorsStr" @input="updateColors($event)" />
          </div>
        </b-row>
      </b-col>
    </b-row>
  </b-container>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
import Flasher from './Flasher.vue';

@Component({
  components: {
    Flasher,
  },
})
export default class FlashSet extends Vue {
  @Prop({ default: 250 })
  private interval!: number;

  @Prop({ default: 'red, white'})
  private colorsStr!: string;

  private updateInterval($event: any) {
    this.interval = $event.target.value;
  }

  private updateColors($event: any) {
    this.colorsStr = $event.target.value;
  }

  private get colors() {
    return this.colorsStr.split(',');
  }
}
</script>

<style>
label {
  margin-right: 10px;
}
.enclosed {
  border: 1px solid black;
  padding: 15px;
  margin: 10px;
}
</style>
