<template>
  <p>текущий курс доллара к рублю: {{ rate }}</p>
</template>

<script type="text/javascript">
import { HTTP } from "../utils/http-common.js";

export default {
  name: "home",
  data() {
    return {
      rate: null
    };
  },
  mounted() {
    HTTP.get("rate.json").then(response => (this.rate = response.data.value));
  }
};
</script>
