<template>
  <div class="sticky-navbar">
    <b-navbar>
      <b-container>
        <b-navbar-brand class="esquerda" href="/" >
          <img
            src="~/static/img/logo_centro universitario integrado-02.png"
            class="d-inline-block align-top"
            alt="Logo"
            
            
          />
          <span class="med">Med</span>
          <span class="arcade">Arcade</span>
        </b-navbar-brand>
        <nuxt-link to="/info/innovamed" class="inova" style="margin-left: auto;">InnovaMed</nuxt-link>
        
      </b-container>
    </b-navbar>
  </div>
</template>


<script>
import Navbar from "~/components/Navbar.vue";
import categorias from "~/mixins/categorias.js";

export default {
  name: "CategoriaPage",
  components: { Navbar },
  mixins: [categorias],
  data() {
    return {
      selectedCategoria: null,
    };
  },
  computed: {
    url() {
      return `https://master.d1mmfysqbrc8g6.amplifyapp.com/${this.$route.params.id}/`;
    },
  },
  mounted() {
    this.selectedCategoria = this.categorias[0];
  }
};
</script>

<style>
.scroll-container {
  overflow-y: hidden;
  max-height: 80vh;
  
}
.inova {
  font-family: 'Arial', sans-serif;
  text-decoration: none;
  padding: 0.5rem 1rem;
  border-bottom: 2px solid #5397d0;
  text-decoration: none;
  line-height: 10px;
  color: #5397d0;
  font-weight: 960;
  cursor: pointer;
}
.inova:hover{
  border-bottom: 2px solid #d0e4f5;
}




.sticky-navbar {
  position: fixed; /* Change from sticky to fixed */
  top: 0;
  left: 0;
  right: 0; /* Adjust to fit the full width of the viewport */
  z-index: 1000;
  box-shadow: 0 10px 20px -5px hsla(231, 100%, 15%, 0.233);
  background-color: rgba(255, 255, 255, 0.904);
}

.esquerda img{
  width: 30px;
  height: 50px;
  position: relative;
  bottom: 0px;
}
.esquerda{
  margin: 0;
  padding: 0;;

}

.med, .arcade{
  font-family: 'Arial', sans-serif;
  font-weight: 560;
  font-size: 1.9rem;
  color: rgb(0, 1, 56);
  margin-bottom: 10px;
  position: relative;
  left: 2px;
  bottom: 0;
  top: 5px;
}

.arcade {
  display: inline-block;
  background: linear-gradient(to right, #c9dff1, #c9dff1, #c9dff1, #5397d0, #11324e, #5397d0, #c9dff1, #c9dff1, #c9dff1) 0 0 / 400% 100% no-repeat;
  background-clip: text;
  color: transparent;
  animation: shade 10s infinite linear;
  
}

@keyframes shade {
  to {
    background-position: 100% 0;
  }
}

</style>
