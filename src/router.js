import Vue from "vue";
import Router from "vue-router";
import Home from "@/views/Pages/Home";
import About from "@/views/Pages/About";
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
    }
  ]
});
