import jogos from "~/database/jogos.js";
import categorias from "~/database/categorias.js";
import { useStore as baseUseStore } from "vuex";

export const useStore = () => {
  return baseUseStore();
};

export const state = () => ({
  jogos,
  categorias
});

export const mutations = {
  SORT_JOGOS(state) {
    state.jogos = state.jogos.sort(function (a, b) {
      if (a.nome > b.nome) return 1;
      if (a.nome < b.nome) return -1;
      return 0;
    });
  },
  SORT_CATEGORIAS(state) {
    state.categorias = state.categorias.sort(function (a, b) {
      if (a.nome > b.nome) return 1;
      if (a.nome < b.nome) return -1;
      return 0;
    });
  },
};
