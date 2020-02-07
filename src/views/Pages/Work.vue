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
        <img src="@/assets/projects/Oneiros/1.png" />
        <h2 class="work-heading font-secondary">Oneiros</h2>
        <p class="text-common font-secondary">
          Oneiros is the annual cultural festival of Manipal University Jaipur. It is one of the biggest cultural festivals in Rajasthan. This site uses WebGL to create an immersive logo experience coupled with beautiful designs which bring out the true colours of this truly glorious festival.
          <br />
          <router-link tag="a" class="text-link-wrapper" to="/work/oneiros">
            <span class="text-link">View Project</span>
          </router-link>
        </p>
      </div>
      <div class="work-item">
        <img src="@/assets/projects/MasalaRaaj/1.png" />
        <h2 class="work-heading font-secondary">Masala Raaj</h2>
        <p class="text-common font-secondary">
          Masala Raaj is a spice brand, hailing from Nagaur, Rajasthan. It combines a richness in taste with a penchant for nurturing customer relationships. According to requirements, a minimalistic, easily navigable yet pleasing to the eyes look is what defines the crux of this website.
          <br />
          <router-link class="text-link-wrapper" to="/work/masalaraaj">
            <span class="text-link">View Project</span>
          </router-link>
        </p>
      </div>
      <div class="work-item">
        <img src="@/assets/projects/Mext/1.png" />
        <h2 class="work-heading font-secondary">Mext</h2>
        <p class="text-common font-secondary">
          Mext is a startup native to our college, which is an all-in-one platform for all things Manipal University Jaipur. It hosts material ranging study material like Question Papers, Notes, Discussion Threads, Polls to Authority Guidelines, Phone Numbers, Local Restaurant menus. A user friendly interface with maximum user interaction ensures a better learning and immersive experience for the students of Manipal University Jaipur.
          <br />
          <router-link class="text-link-wrapper" to="/work/mext">
            <span class="text-link">View Project</span>
          </router-link>
        </p>
      </div>
      <div class="work-item">
        <img src="@/assets/projects/NHS/1.png" />
        <h2 class="work-heading font-secondary">NHS Hospital</h2>
        <p class="text-common font-secondary">
          Nasa Hub &amp; Multispeciality Hospital is a Jalandhar-based healthcare institution which provides a diverse range of healthcare services. It provides premier 24x7 services.
          <br />
          <router-link class="text-link-wrapper" to="/work/nhs">
            <span class="text-link">View Project</span>
          </router-link>
        </p>
      </div>
      <div class="work-item">
        <img src="@/assets/projects/Recrewt/1.png" />
        <h2 class="work-heading font-secondary">Recrewt</h2>
        <p class="text-common font-secondary">
          Recewt is a job portal where recruiters can meet job-seekers. It has been crafted specifically with the college use-case in mind, where any individual who has any idea worth merit should not face the problem of connecting with other like-minded as well as skilled individuals, to aid in the progression of the idea from ideation to production.
          <br />
          <router-link class="text-link-wrapper" to="/work/recrewt">
            <span class="text-link">View Project</span>
          </router-link>
        </p>
      </div>
      <div class="work-item">
        <img src="@/assets/projects/Abhivarta/1.png" />
        <h2 class="work-heading font-secondary">Abhivarta</h2>
        <p class="text-common font-secondary">
          Abhivarta is the annual sports festival of Manipal University Jaipur. It boasts a fusion of sports and players spanning the whole of India and can aptly be termed as the one of the biggest sports festivals in India. The site uses fluid animations which deliver a sporty feel to it.
          <br />
          <router-link class="text-link-wrapper" to="/work/abhivarta">
            <span class="text-link">View Project</span>
          </router-link>
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
  mounted () {
    window.addEventListener('scroll',() => {}, true);
  },
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
