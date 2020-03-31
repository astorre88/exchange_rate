<template>
  <p>текущий курс доллара к рублю: {{ rate }}</p>
</template>

<script type="text/javascript">
import { getters, actions } from "../packs/store.js";

export default {
  data() {
    return {};
  },
  computed: {
    ...getters
  },
  methods: {
    ...actions
  },
  mounted() {
    this.fetchRateFromApi("rate.json");
  }
};
</script>
