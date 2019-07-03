<template>
  <nav :class="navbarClass" data-wow-duration="0.2s" data-wow-delay="0.5s">
    <div class="home-link">
      <h3>
        <a href="#">Parth Jawale</a>
      </h3>
    </div>
    <input type="checkbox" id="nav-toggle-checkbox" name="nav-toggle-checkbox" />
    <label :class="labelClass" for="nav-toggle-checkbox" @click="navToggleClicked">
      <span class="nav-toggle-text">Menu</span>
      <span class="hamburger"></span>
    </label>
    <div :class="linksClass">
      <ul>
        <li :class="listItemsClass">
          <a>
            <span data-hover="About">About</span>
          </a>
        </li>
        <li :class="listItemsClass">
          <a>
            <span data-hover="Contact">Contact</span>
          </a>
        </li>
      </ul>
    </div>
    <div :class="footerClass">
      <div class="footer-row">
        <ul>
          <li class="link-hover">
            <a href="https://www.linkedin.com/in/parth-jawale/" target="_blank">
              <span data-hover="Linkedin">LinkedIn</span>
            </a>
          </li>
          <li class="link-hover">
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
          this.navbarClass = "navbar b-primary wow fadeIn";
        }, 500);
      }
    }
  }
};
</script>