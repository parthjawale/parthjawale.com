<template>
  <div id="app">
    <navbar v-show="dataLoaded" />
    <router-view />
    <!-- <backmask v-if="!hideMask" :loaded="dataLoaded" /> -->
    <preloader :loaded="dataLoaded" :hideMask="!hideMask" />
    <mouse />
    <footr v-show="dataLoaded" />
  </div>
</template>

<style lang="scss">
@import "@/scss/main.scss";
</style>

<script>
import { bus } from "@/main";
import WOW from "wow.js";
import Backmask from "@/components/Globals/Backmask";
import Preloader from "@/components/Globals/Preloader";
import Navbar from "@/components/Globals/Navbar";
import Mouse from "@/components/Globals/MousePointer";
import Footer from "@/components/Globals/Footer";

export default {
  components: {
    backmask: Backmask,
    preloader: Preloader,
    navbar: Navbar,
    mouse: Mouse,
    footr: Footer
  },
  data() {
    return {
      dataLoaded: false,
      hideMask: false
    };
  },
  created() {
    let _this = this;
    bus.$on("componentLoaded", data => {
      setTimeout(function() {
        _this.dataLoaded = true;
        setTimeout(function() {
          _this.hideMask = true;
        }, 2500);
      }, 1000);
    });
    bus.$on("backmask-clip-start", function() {
      setTimeout(() => {
        new WOW().init();
      }, 1000);
    });
  }
};
</script>
