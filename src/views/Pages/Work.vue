<template>
  <div class="px-2 pt-5 pb-5-desktop work b-primary pb-5-mobile" id="work">
    <div class="heading px-2-desktop">
      <h1
        class="heading-super font-primary wow fadeInUp"
        data-wow-delay="0.5s"
      >Here's some of my work.</h1>
    </div>
    <div class="work-showcase pt-4-desktop wow fadeIn" data-wow-delay="0.9s">
      <div class="work-item"></div>
      <div class="work-item"></div>
    </div>
    <div class="scroll-reminder wow fadeIn d-none-mobile" data-wow-delay="0.9s">
      <a :class="[{'pointer-all': endOfPage}, {'pointer-none': !endOfPage}]" href="#work">
        <i :class="['fas', 'fa-angle-left' ,'px-1', {active: buttonActive }, {rotate: endOfPage}]"></i>
        <span>Scroll</span>
      </a>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    pageYOffset: 0,
    buttonActive: true,
    endOfPage: false
  }),
  methods: {
    handleScroll(event) {
      this.pageYOffset = window.pageYOffset;
    },
    scroll() {
      window.onscroll = () => {
        let bottomWindow =
          Math.max(
            window.pageYOffset,
            document.documentElement.scrollTop,
            document.body.scrollTop
          ) +
            window.innerHeight ===
          document.documentElement.offsetHeight;
        if (bottomWindow) this.endOfPage = true;
        else this.endOfPage = false;
      };
    }
  },
  mounted() {
    this.scroll();
  },
  watch: {
    pageYOffset(data) {
      if (data > 70) {
        this.buttonActive = false;
      } else {
        this.buttonActive = true;
      }
    }
  },
  created() {
    window.addEventListener("scroll", this.handleScroll);
  },
  destroyed() {
    window.removeEventListener("scroll", this.handleScroll);
  }
};
</script>
