<template>
  <div>
    <b-form inline>
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
        locale="en"
      ></b-form-timepicker>

      <b-button variant="primary">Save</b-button>
    </b-form>
  </div>
</template>

<script type="text/javascript">
import { HTTP } from "../utils/http-common.js";

export default {
  data() {
    return {
      form: {
        rate: "",
        date: "",
        time: ""
      }
    };
  },
  mounted() {
    HTTP.get("rate.json").then(response => {
      const date_time = response.data.until_time.split("T");
      this.form = {
        rate: response.data.value,
        date: date_time[0],
        time: date_time[1]
      };
    });
  }
};
</script>
