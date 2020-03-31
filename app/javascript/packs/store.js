import Vue from 'vue';
import {
  HTTP
} from "../utils/http-common.js";

const state = Vue.observable({
  rate: null
});

export const getters = {
  rate() {
    return state.rate
  }
}

export const mutations = {
  setRate(val) {
    state.rate = val
  }
}

export const actions = {
  fetchRateFromApi(path) {
    return HTTP.get(path)
      .then(response => mutations.setRate(response.data.value))
      .catch(error => console.log(error));
  }
}
