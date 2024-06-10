<template clas="back">
  <iframe class="jogo" :src="url" frameborder="0"></iframe>
</template>

<script>
export default {
  computed: {
    url() {
      return `https://master.d1mmfysqbrc8g6.amplifyapp.com/${this.$route.params.jogo}/`;
    },
  },
};
</script>

<style scoped>
body {
  margin: 0 !important; /* Reset default margin */
}
.jogo {
  display: block; /* iframes are inline by default */
  background-color: #004edf;
  border: none; /* Reset default border */
  height: 100vh; /* Viewport-relative units */
  width: 100vw;
}
</style>
