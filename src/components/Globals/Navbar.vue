<template>
  <nav :class="navbarClass" data-wow-duration="0.2s" data-wow-delay="0.5s">
    <div class="home-link">
      <h3>
        <a @click="homeLinkClicked('/')" to="/">Parth Jawale</a>
      </h3>
    </div>
    <input
      type="checkbox"
      v-model="checkboxVal"
      id="nav-toggle-checkbox"
      name="nav-toggle-checkbox"
    />
    <label :class="labelClass" for="nav-toggle-checkbox" @click="navToggleClicked">
      <span class="nav-toggle-text">Menu</span>
      <span class="hamburger"></span>
    </label>
    <div :class="linksClass">
      <ul>
        <li :class="[listItemsClass, 'd-none-desktop']">
          <a @click="navLinkClicked('/')">
            <span data-hover="Home">Home</span>
          </a>
        </li>
        <li :class="listItemsClass">
          <a @click="navLinkClicked('/about')">
            <span data-hover="About">About</span>
          </a>
        </li>
        <li :class="listItemsClass">
          <a @click="navLinkClicked('/contact')">
            <span data-hover="Contact">Contact</span>
          </a>
        </li>
      </ul>
    </div>
    <div :class="footerClass">
      <div class="footer-row">
        <ul>
          <li>
            <a href="https://www.linkedin.com/in/parth-jawale/" target="_blank">
              <span data-hover="Linkedin">LinkedIn</span>
            </a>
          </li>
          <li>
            <a href="https://www.facebook.com/pjawale.007" target="_blank">
              <span data-hover="Facebook">Facebook</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  data: () => {
    return {
      labelClass: "nav-toggle d-none-desktop",
      navbarClass: "navbar b-primary wow fadeIn",
      linksClass: "links",
      listItemsClass: "link-hover",
      checkboxVal: false,
      footerClass: "footer-social d-none-desktop opac-0-mobile"
    };
  },
  methods: {
    navToggleClicked() {
      if (this.labelClass.indexOf("nav-opened") == -1) {
        this.labelClass += " nav-opened";
        this.linksClass += " opened-nav";
        this.navbarClass += " navbar-open-nav";
        setTimeout(() => {
          this.listItemsClass += " link-animation";
          this.footerClass = "footer-social d-none-desktop";
        }, 500);
      } else {
        this.listItemsClass = "link-hover";
        this.footerClass += " opac-0";
        setTimeout(() => {
          this.labelClass = "nav-toggle d-none-desktop";
          this.linksClass = "links";
          this.checkboxVal = false;
          this.navbarClass = "navbar b-primary wow fadeIn";
        }, 500);
      }
    },
    navLinkClicked(to) {
      if (screen.width < 768) {
        this.navToggleClicked();
        setTimeout(() => {
          this.$router.push(to);
        }, 800);
      } else {
        this.$router.push(to);
      }
    },
    homeLinkClicked(to) {
      if (screen.width < 768) {
        this.listItemsClass = "link-hover";
        this.footerClass = "footer-social d-none-desktop opac-0";
        setTimeout(() => {
          this.labelClass = "nav-toggle d-none-desktop";
          this.checkboxVal = false;
          this.linksClass = "links";
          this.navbarClass = "navbar b-primary wow fadeIn";
        }, 500);
        setTimeout(() => {
          this.$router.push(to);
        }, 800);
      } else {
        this.$router.push(to);
      }
    }
  }
};
</script>