<template class="rolagem-1" >
  <div >
    
    <Navbar />
    <div class="container-wrapper-1">
      
      <article class="article-id-1">
        <ul class="grid-1" id="category-list-1">
          <li v-for="categoria in categorias" :key="categoria.nome" class="category-1">
            <nuxt-link :to="'/categoria/' + categoria.id" >
              <div class="item-1">
                <div class="item_icon-1">
                  <img :src="categoria.icon" :alt="categoria.alt" />
                </div>
                <div class="item_text-1">{{ categoria.nome }}</div>
              </div>
            </nuxt-link>
          </li>
        </ul>
      </article>
      <div class="search-container">
        <input type="text" placeholder="Barra de busca em breve..." class="search-input" />
        <button>X</button>
      </div>
      <div class="categoria-achada">
      <p class="texto-adicional">Categoria Selecionada: <p class="categoriaSelecionada">{{ selectedCategoria }}</p></p>
    </div>
    </div>
    <div class="card-container">
      <div class="stars" ></div>
      <div class="stars2" ></div>
      <b-container class="mt-4"></b-container>
      <b-container>
        <b-row>
          <b-col cols="12">
            <b-card-group columns>
              <Card
                v-for="jogo of jogosFiltrados"
                :key="jogo.url"
                :nome="jogo.nome"
                :descricao="jogo.descricao"
                :desenvolvedor="jogo.desenvolvedor"
                :suporte="jogo.suporte"
                :revisor="jogo.revisor"
                :data="jogo.data"
                :url="jogo.url"
                :imagem="jogo.imagem"
              />
            </b-card-group>
          </b-col>
        </b-row>
      </b-container>
      <b-container class="mt-4"></b-container>
    </div> 
  </div> 
</template>

<script>
import Navbar from "~/components/Navbar.vue";
import Card from "~/components/Card.vue";
import jogos from "~/mixins/jogos.js";
import categoria from "~/database/categorias.js";

export default {
  name: "CategoriaPage",
  components: { Navbar, Card },
  mixins: [jogos],
  data() {
    return {
      selectedCategoria: null,
      categorias: categoria,
    };
  },
  computed: {
    url() {
      return `https://master.d1mmfysqbrc8g6.amplifyapp.com/${this.$route.params.id}/`;
    },
    jogosFiltrados: function () {
      if (!this.$route.params.id) return this.jogos;
      return this.jogos.filter((jogo) => jogo.categoria == this.$route.params.id);
    },
  },
  mounted() {
    const id = parseInt(this.$route.params.id);
    if (id === 1) {
      this.selectedCategoria = "Anatomia e Fisiologia Básica";
    } else if (id === 2) {
      this.selectedCategoria = "Anatomia e Fisiologia Cardíaca";
    } else if (id === 3) {
      this.selectedCategoria = "Anatomia e Fisiologia do Olho";
    } else if (id === 4) {
      this.selectedCategoria = "Anatomia e Fisiologia do Sistema Esquelético";
    } else if (id === 5) {
      this.selectedCategoria = "Anatomia e Fisiologia do Sistema Nervoso";
    } else if (id === 6) {
      this.selectedCategoria = "Farmacologia";
    } else if (id === 7) {
      this.selectedCategoria = "Semiologia e Semiotécnica";
    } else if (id === 8) {
      this.selectedCategoria = "Quiz e Desafios";
    } else if (id === 9) {
      this.selectedCategoria = "Técnica Cirúrgica";
    } else if (id === 10) {
      this.selectedCategoria = "Células";
    } else if (id === 11) {
      this.selectedCategoria = "Sangue e Homeostase";
    } else if (id === 12) {
      this.selectedCategoria = "Doenças";
    } else if (id === 13) {
      this.selectedCategoria = "Sistemas";
    } else if (id === 14) {
      this.selectedCategoria = "Radiologia";
    } else if (id === 15) {
      this.selectedCategoria = "Radiologia Patológica";
    } else if (id === 16) {
      this.selectedCategoria = "Laminário";
    } else if (id === 17) {
      this.selectedCategoria = "Anatomia Muscular";
    } else {
      this.selectedCategoria = null; // ID não corresponde a nenhuma categoria conhecida
    }

    let isPageReloaded = sessionStorage.getItem("isPageReloaded");

    if (!isPageReloaded) {
      sessionStorage.setItem("isPageReloaded", "true");
      window.location.reload();
    } else {
      sessionStorage.removeItem("isPageReloaded");
    }
  },
};
</script>


<style>


.container-wrapper-1 {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  
}
.categoria-achada{
  display: flex;
  line-height: 2;
  border-bottom: 1px solid #5398d03b;
  width: 100%;
  margin-top:40px;
  justify-content: center;
  text-align: center;
}
.categoriaSelecionada{
  font-family: 'Arial', sans-serif;
  font-size: 20px;
  font-weight: 660;
  color: #11324e;
  margin-left:10px;
 
}

.texto-categorias {
  width: 100%;
  padding: 10px 0;
  font-weight: 600;
  font-size: 20px;
  color: #5398d0ec;
  font-family: 'Arial', sans-serif;
  text-align: center;
  margin-top: 30px;
  border-bottom: #5398d03b solid 1px;
}

.grid-1 {
  display: flex;
  overflow-x: auto;
  list-style: none;
  width: 100%;
  background-color: #ffffff;
}

.grid-1::-webkit-scrollbar {
  height: 5px;
}

.grid-1::-webkit-scrollbar-thumb {
  background-color: #5397d0;
  border-radius: 5px;
}

.category-1 {
  min-width: 300px;
  height: 30px;
  margin:10px;
  margin-top: 100px;
  text-decoration: none;
  font-size: 12px;
  font-weight: 700;
  color: #11324e;
}

.category-1 a {
  text-decoration: none;
}

.article-id-1 {
  display: flex;
  justify-content: center;
  width: 100%;
  
}

.search-container {
  margin-top: 10px;
  display: flex;
  width: 100%;
  margin-left: 115%;
  
}

.search-input {
  padding: 10px;
  border-radius: 2px 0 0 2px;
  width: 40%;
  border:none;
  height: 40px;
  outline: none;
  background-color: #ffffff;
  box-shadow: 0 2px 5px 0px hsla(0, 0%, 0%, 0.308);
}

button {
  border: none;
  background-color: red;
  color: #ffffff;
  font-weight: 600;
  height: 40px;
  border-radius: 0 5px 5px 0;
  padding: 10px;
  box-shadow: 0 2px 2px 0px hsla(0, 0%, 0%, 0.308);
}

.card-container {
  width: 100%;
  margin-top: 0px;
  overflow-y: auto;
  background: linear-gradient(0, #c9dff1, #ffffff);
}

.texto-adicional {
  font-family: 'Arial', sans-serif;
  font-size: 20px;
  font-weight: 660;
  color: #5398d0ec;
}

.rolagem-1  {
  padding: 0;
  overflow-x: hidden;
  display: grid;
  place-items: center;
  height: 100vh;
  color: hsla(236, 100%, 50%, 0.267);
  font-family: "Geist Sans", "SF Pro Text", "SF Pro Icons", "AOS Icons", "Helvetica Neue", Helvetica, Arial, sans-serif, system-ui;
  background-image: radial-gradient(at 27% 37%, #c9dff1 0px, transparent 50%), radial-gradient(at 97% 21%, #5397d0 0px, transparent 50%), radial-gradient(at 52% 99%, #c9dff1 0px, transparent 50%), radial-gradient(at 10% 29%, #5397d0 0px, transparent 50%), radial-gradient(at 97% 96%, #c9dff1 0px, transparent 50%), radial-gradient(at 33% 50%, #c9dff1 0px, transparent 50%), radial-gradient(at 79% 53%, #5397d0 0px, transparent 50%);
  background-color: #c9dff1;
  font-weight: 80;
  transition: background-color 0.25s, color 0.25s;
  font-size: 16px;
}

.category-container-1 {
  width: 50%;
  padding: 0;
  margin-top: 70px;
}

.window-1 {
  container-type: inline-size;
  transform-style: preserve-3d;
  width: 100%;
  outline: 4px dashed transparent;
  transition: outline 0.5s;
}

.scene-1 {
  --buff: 1rem;
  margin-top: 10px;
  height: 90%;
  width: 100%;
  mask: linear-gradient(transparent, rgb(255, 255, 255) var(--buff) calc(100% - var(--buff)), transparent), linear-gradient(90deg, transparent, rgb(255, 255, 255) var(--buff) calc(100% - var(--buff)), transparent);
  mask-composite: intersect;
}

.category-1 {
  min-height: 70px;
  transform-style: preserve-3d;
  text-decoration: none;
  width: 100%;
  z-index: calc(1 + var(--active));
}

/*.category::before {
  content: "";
  position: absolute;
  inset: 0px 0px -5px 0px;
  border-radius: 10px;
  background: #ffffff;
  filter: blur(calc(var(--active, 0) * 8px));
  z-index: -1;
  margin-top: 20px;
  transition: scale var(--transition), opacity var(--transition), translate var(--transition), filter var(--transition);
  transform-origin: 50% 0;
  scale: 1 calc(1 + (var(--active, 0) * 0.05));
  --tw-shadow: 0 6px 8px -2px rgb(0 0 0 / 0.1);
  box-shadow: 0 6px 8px -2px rgb(0 0 0 / 0.1);
}*/
.category-1:hover {
  cursor: pointer;
  scale:1.03;
}

.item-1 {
  align-items: center;
  background: linear-gradient(to right, #5397d0, #dbe7f1) 0  0 / 200%   100% no-repeat;
  transition: background-position 8s;
  color: #ffffff;
  margin-bottom: 15px;
  border-radius: 6px;
  cursor: pointer;
  display: flex;
  gap: 1rem;
  height: 100%;
  justify-content: center;
  overflow: hidden;
  padding: 1rem;
  text-align: center;
  width: 100%;
  text-decoration: none;
  transition: background-color 0.25s, color 0.25s, border 0.25s, box-shadow 0.25s;
}

.item_icon-1 {
  position: relative;
  top: 2px;
}

.item_icon-1 img {
  width: 40px;
  height: 40px;
}

.item_text-1 {
  flex: 1;
  text-decoration: none;
  text-align: center;
}

@media (prefers-reduced-motion: no-preference) {
  .category-1:hover {
    --active: 2;
  }
}

.texto-adicional-2 {
  font-family: 'Arial', sans-serif;
  font-size: 16px;
  font-weight: 960px;
  color: #11324e;
  line-height: 2;
  text-align: center;
  border-top: 0.5px solid #11324e;
  padding: 10px;
}


</style>
