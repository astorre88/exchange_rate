<template>
  <p>текущий курс доллара к рублю: {{ rate }}</p>
</template>

<script type="text/javascript">
import { getters, mutations, actions } from "../packs/store.js";

export default {
  data() {
    return {};
  },
  computed: {
    ...getters
  },
  channels: {
    RateChannel: {
      connected() {},
      received(data) {
        this.setRate(data.content.value);
      }
    }
  },
  methods: {
    ...mutations,
    ...actions
  },
  mounted() {
    this.fetchRateFromApi("rate.json");
    this.$cable.subscribe({
      channel: "RateChannel"
    });
  }
};
</script>
