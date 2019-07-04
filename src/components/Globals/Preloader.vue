<template>
  <div class="full-page preload-screen" v-show="!preloadDone">
    <div :class="backmaskClass" v-if="hideMask"></div>
    <transition name="fade">
      <div :class="preloaderClass" v-if="!loaded"></div>
    </transition>
  </div>
</template>

<script>
import Backmask from "@/components/Globals/Backmask";
import { bus } from "@/main";
import { setTimeout } from "timers";
export default {
  props: ["loaded", "hideMask"],
  components: {
    backmask: Backmask
  },
  data() {
    return {
      preloadDone: false,
      // loaded: false,
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
          if (screen.width > 768) {
            document.body.classList += "loaded";
          } else {
            document.body.classList += "loaded";
          }
        }, 700);
        setTimeout(function() {
          this.backmaskClass = bus.$emit("backmask-clip-start");
        }, 900);
      }
    }
  }
};
</script>