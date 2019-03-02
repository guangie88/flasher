<template>
  <b-container>
    <b-row>
      <b-col sm="6" md="7">
        <Flasher
          :colors="colors"
          :interval="interval"
          :disableMsg="disableMsg"
          msg="Double click to toggle fullscreen"
        />
      </b-col>
      <b-col sm="6" md="5">
        <b-form-group horizontal label-class="text-sm-right" label-size="sm" label="Interval (ms)" label-for="interval">
          <b-form-input id="interval" size="sm" type="number" v-model="interval" />
          <b-form-text>{{ bpm }} BPM</b-form-text>
        </b-form-group>
        <b-form-group horizontal label-class="text-sm-right" label-size="sm" label="Color(s)" label-for="colors">
          <b-form-input id="colors" size="sm" v-model="colorsStr" />
        </b-form-group>
        <b-form-checkbox id="disableMsg" size="sm" v-model="disableMsg">Disable text</b-form-checkbox>
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
  @Prop({ default: 200 })
  private interval!: number;

  @Prop({ default: 'red, white'})
  private colorsStr!: string;

  @Prop({ default: false })
  private disableMsg!: boolean;

  private get colors() {
    return this.colorsStr.split(',');
  }

  private get bpm() {
    return 1.0 / this.interval * 60000 / this.colors.length;
  }
}
</script>

<style>
</style>
