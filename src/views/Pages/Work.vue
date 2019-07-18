<template>
  <div class="px-2 pt-5 pb-5-desktop work b-primary pb-5-mobile" id="work">
    <div class="heading px-2-desktop">
      <h1
        class="heading-super font-primary wow fadeInUp"
        data-wow-delay="0.5s"
      >Here's some of my work.</h1>
    </div>
    <div class="work-showcase pt-4-desktop wow fadeIn" data-wow-delay="0.9s">
      <div class="work-item">
        <img src="@/assets/projects/Oneiros/2.png" />
        <h2 class="work-heading">Oneiros</h2>
        <p class="text-common">
          Laboris minim irure cillum proident. Nisi occaecat quis veniam laborum Lorem duis et. Eiusmod esse ullamco laborum exercitation fugiat excepteur ea. Veniam velit ullamco esse dolor minim.
          <br />Nulla sunt dolore ipsum ex ullamco ad. Mollit deserunt eiusmod duis eiusmod aliquip ex eiusmod culpa consequat duis commodo sint. Anim dolore laboris voluptate in culpa do tempor ea reprehenderit laboris incididunt minim.
          <br />
          <a class="text-link-wrapper" href="https://oneiros.mext.in" target="_blank">
            <span class="text-link">View Project</span>
          </a>
        </p>
      </div>
      <div class="work-item">
        <img src="@/assets/projects/MasalaRaaj/1.png" />
        <h2 class="work-heading">Masala Raaj</h2>
        <p class="text-common">
          Laboris minim irure cillum proident. Nisi occaecat quis veniam laborum Lorem duis et. Eiusmod esse ullamco laborum exercitation fugiat excepteur ea. Veniam velit ullamco esse dolor minim.
          <br />Nulla sunt dolore ipsum ex ullamco ad. Mollit deserunt eiusmod duis eiusmod aliquip ex eiusmod culpa consequat duis commodo sint. Anim dolore laboris voluptate in culpa do tempor ea reprehenderit laboris incididunt minim.
          <br />
          <a class="text-link-wrapper" href="https://masalaraaj.parthjawale.com" target="_blank">
            <span class="text-link">View Project</span>
          </a>
        </p>
      </div>
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
