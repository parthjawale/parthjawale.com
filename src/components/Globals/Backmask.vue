<template>
  <div :class="backmaskClass"></div>
</template>

<script>
import { bus } from "@/main";
export default {
  props: ["loaded"],
  data() {
    return {
      backmaskClass: "backmask full-page b-primary"
    };
  },
  watch: {
    loaded(data) {
      if (data) {
        // setTimeout(() => {
        document.body.classList += "loaded";
        this.backmaskClass = bus.$emit("backmask-clip-start");
        // }, 700);
      }
    }
  }
};
</script>