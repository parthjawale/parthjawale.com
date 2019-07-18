<template>
  <div
    v-show="show"
    :class="['mouse-pointer', 'd-none-mobile', {'hovered-link':hoveredLink}]"
    :style="`top:${top};left:${left}`"
  ></div>
</template>

<script>
export default {
  props: ["hoveredLink", "show"],
  data: () => ({
    top: "0px",
    left: "0px"
  }),
  created() {
    this.mouseMover();
  },
  methods: {
    mouseMover() {
      let _this = this;
      window.addEventListener("mousemove", e => {
        _this.top = `${e.clientY}px`;
        _this.left = `${e.clientX}px`;
      });
    }
  }
};
</script>