<template>
  <div class="full-page preload-screen" v-show="!preloadDone">
    <div :class="backmaskClass" v-if="hideMask"></div>
    <transition name="fade">
      <div :class="preloaderClass" v-if="!loaded"></div>
    </transition>
  </div>
</template>

<script>
import { bus } from "@/main";
import { setTimeout } from "timers";
export default {
  props: ["loaded", "hideMask"],
  data() {
    return {
      preloadDone: false,
      backmaskClass: "backmask b-primary",
      preloaderClass: "preloader"
    };
  },
  watch: {
    loaded(data) {
      if (data) {
        setTimeout(() => {
          this.preloadDone = true;
        }, 1500);
        setTimeout(() => {
          document.body.classList += "loaded";
        }, 700);
        setTimeout(function() {
          bus.$emit("backmask-clip-start");
        }, 700);
      }
    }
  }
};
</script>