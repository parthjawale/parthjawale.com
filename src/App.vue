<template>
  <div id="app">
    <transition name="fade">
      <navbar v-show="dataLoaded && navbarVisible" />
    </transition>
    <preloader :loaded="dataLoaded" :hideMask="!hideMask" />
    <mouse :show="showMousePointer" :hoveredLink="hoveredLink" />
    <layout />
    <transition name="fade">
      <footr v-show="dataLoaded && footerVisible" />
    </transition>
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
import MousePointer from "@/components/Globals/MousePointer";
import Layout from "@/views/Layouts/HomeLayout";
import Footer from "@/components/Globals/Footer";

export default {
  components: {
    backmask: Backmask,
    preloader: Preloader,
    navbar: Navbar,
    mouse: MousePointer,
    layout: Layout,
    footr: Footer
  },
  data() {
    return {
      dataLoaded: false,
      hideMask: false,
      hoveredLink: false,
      showMousePointer: false,
      navbarVisible: true,
      footerVisible: true
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
        _this.showMousePointer = true;
      }, 900);
    });
    bus.$on("hideNavbarAndFooter", function() {
      _this.navbarVisible = false;
      _this.footerVisible = false;
    });
    bus.$on("showNavbarAndFooter", function() {
      _this.navbarVisible = true;
      _this.footerVisible = true;
    });
  }
};
</script>
