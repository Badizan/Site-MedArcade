export default {
  computed: {
    jogos() {
      return this.$store.state.jogos;
    },
  },
  methods: {
    sort() {
      this.$store.commit("SORT_JOGOS");
    },
  },
};
