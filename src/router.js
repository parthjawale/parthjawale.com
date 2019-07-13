import Vue from "vue";
import Router from "vue-router";
import Home from "@/views/Pages/Home";
import About from "@/views/Pages/About";
import Contact from "@/views/Pages/Contact";
import Work from "@/views/Pages/Work";

Vue.use(Router);

export default new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: "/",
      name: "Home",
      component: Home
    },
    {
      path: "/about",
      name: "About",
      component: About
    },
    {
      path: "/contact",
      name: "Contact",
      component: Contact
    },
    {
      path: "/work",
      name: "Work",
      component: Work
    }
  ],
  scrollBehavior(to, from, savedPosition) {
    return {
      x: 0,
      y: 0
    };
  }
});
