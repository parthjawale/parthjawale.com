<template>
  <div id="app">
    <transition name="fade">
      <navbar v-show="dataLoaded" />
    </transition>
    <preloader :loaded="dataLoaded" :hideMask="!hideMask" />
    <mouse :hoveredLink="hoveredLink" />
    <layout />
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
      hoveredLink: false
    };
  },
  created() {
    let _this = this;
    var elements = document.getElementsByTagName("a");
    for (var i = 0, len = elements.length; i < len; i++) {
      elements[i].addEventListener("mouseover", function() {
        console.log("in");
      });
    }
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
      }, 900);
    });
  }
};
</script>
