// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import Vue from "vue";
import {
  BootstrapVue,
  IconsPlugin
} from 'bootstrap-vue'
import VueRouter from "vue-router";
import App from "../components/App";
import Home from "../components/Home";
import Admin from "../components/Admin";

Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
Vue.use(VueRouter);
const router = new VueRouter({
  mode: "history",
  routes: [{
      path: "/",
      component: Home
    },
    {
      path: "/admin",
      component: Admin
    }
  ]
});

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    render: h => h(App),
    router
  }).$mount();
  document.body.appendChild(app.$el);
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
