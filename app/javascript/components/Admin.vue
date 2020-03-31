<template>
  <div>
    <p v-if="errors.length">
      <b>Errors:</b>
      <ul>
        <li :key="error" v-for="error in errors">{{ error }}</li>
      </ul>
    </p>
    <b-form @submit="saveRate" inline>
      <b-form-input
        v-model="form.rate"
        type="number"
        class="mb-2 mr-sm-2 mb-sm-0"
      ></b-form-input>

      <b-form-datepicker
        v-model="form.date"
        class="mb-2 mr-sm-2 mb-sm-0"
      ></b-form-datepicker>

      <b-form-timepicker
        v-model="form.time"
        class="mb-2 mr-sm-2 mb-sm-0"
        local="ru"
      ></b-form-timepicker>

      <b-button type="submit" variant="primary">Save</b-button>
    </b-form>
  </div>
</template>

<script type="text/javascript">
import { HTTP } from "../utils/http-common.js";
import { mutations } from "../packs/store.js";

export default {
  data() {
    return {
      errors: [],
      form: {
        rate: "",
        date: "",
        time: ""
      }
    };
  },
  methods: {
    ...mutations,
    saveRate(evt) {
      this.errors = [];

      if (!this.form.rate) {
        this.errors.push('Enter rate');
      }
      if (!this.form.date) {
        this.errors.push('Enter date');
      }
      if (!this.form.time) {
        this.errors.push('Enter time');
      }

      if (!this.errors.length) {
        HTTP.post("rate.json", this.form)
          .then(response => this.setRate(response.data.value))
          .catch(error => console.log(error));
      }

      evt.preventDefault();
    },
    parseResponse(data) {
      const date_time = data.until_time.split("T");
      this.form = {
        rate: data.value,
        date: date_time[0],
        time: date_time[1].split('.')[0]
      };
    }
  },
  mounted() {
    HTTP.get("show_admin.json")
        .then(response => this.parseResponse(response.data))
        .catch(error => console.log(error));
  }
};
</script>
