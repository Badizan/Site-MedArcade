export default {
  computed: {
    categorias() {
      return this.$store.state.categorias;
    },
  },
  methods: {
    sort() {
      this.$store.commit("SORT_CATEGORIAS");
    },
  },
};
