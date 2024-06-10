<template>
  <b-card class="card-jogo" tag="article" target="_self">
    <b-row class="h-100">
      <!-- Coluna para a imagem -->
      <b-col cols="4" class="h-100">
        <b-card-img class="img-jogo" :src="imagem" :alt="nome"></b-card-img>
      </b-col>

      <!-- Coluna para a descrição e outras informações -->
      <b-col class="h-100">
        <!-- Título -->
        <b-card-text class="titulo">
          <h5 class="text-center-raf">{{ nome }}</h5>
        </b-card-text>
        <container class="infos-card">
        <b-card-text class="descricao">
          <h5>Descrição:</h5>
          <h4>{{ descricao }}</h4>
        </b-card-text>
        <b-card-text class="desenvolvedor">
          <h5>Desenvolvedor(es):</h5>
          <h4>{{ desenvolvedor }}</h4>
        </b-card-text>
        <b-card-text class="suporte">
          <h5>Suporte Técnico:</h5>
          <h4>{{ suporte }}</h4>
        </b-card-text>
        <b-card-text class="revisor">
          <h5>Revisor(es):</h5>
          <h4>{{ revisor }}</h4>
        </b-card-text>
        <b-card-text class="data">
          <h5>Data de Lançamento:</h5>
          <h4>{{ data }}</h4>
        </b-card-text>
      </container>
        <div class="pushable">
          <span class="front" @click="redirectToUrl">
            Jogar
          </span>
        </div>
      </b-col>
    </b-row>
  </b-card>
</template>

<script>
export default {
  props: {
    nome: {
      type: String,
      required: true,
    },
    descricao: {
      type: String,
      required: true,
    },
    desenvolvedor: {
      type: String,
      required: true,
    },
    suporte: {
      type: String,
      required: true,
    },
    revisor: {
      type: String,
      required: true,
    }, 
    data: {
      type: String,
      required: true,
    },
    url: {
      type: String,
      required: true,
    },
    imagem: {
      type: String,
      required: true,
    },
  },
  methods: {
    redirectToUrl() {
      window.location.href = this.url;
    },
  },
};
</script>

<style>

/*<b-card-text class="desenvolvedor">
          <h5>Desenvolvedor(es):</h5>
          <h4>{{ desenvolvedor }}</h4>
        </b-card-text>
        <b-card-text class="suporte">
          <h5>Suporte Técnico:</h5>
          <h4>{{ suporte }}</h4>
        </b-card-text>
        <b-card-text class="revisor">
          <h5>Revisor(es):</h5>
          <h4>{{ revisor }}</h4>
        </b-card-text>
        <b-card-text class="data">
          <h5>Data de Lançamento:</h5>
          <h4>{{ data }}</h4>
        </b-card-text>*/ 
.card-jogo {
  width: 100%;
  height: 250px; /* Altura fixa para o card */
  background-color: #ffffff;
  border: none;
  border-left: 10px solid #5397d0;
  box-shadow: 0 10px 20px -5px #5398d05a;
  transition: transform 0.2s;
  margin-bottom: 4%;
  overflow: hidden; /* Esconde conteúdo que ultrapassa a altura fixa */
}

.card-jogo:hover {
  cursor: pointer;
  transform: scale(1.02);
}

.infos-card{
  display: flex;
  margin-top:0px;
  position: absolute;
}

.img-jogo {
  width: 100%;
  height: 100%; /* Ajusta a imagem para preencher a coluna */
  margin-top:-5px;
}

.text-center-raf {
  text-transform: uppercase;
  border-radius: 5px;
  text-align: center;
  padding-top: 2px;
  padding-bottom: 2px;
  color: rgb(255, 255, 255);
  background-color: #5397d0;
  box-shadow: 0 10px 20px -5px hsla(231, 100%, 15%, 0.336);
}


.descricao{
  background-color: rgba(142, 142, 159, 0);
  border-radius: 5px;
  height:50%;
  width:100%;
  margin-top:-1px;
  display: flex;
  position:relative;
}
.descricao h4{
  color: #5397d0;
  text-align: center;
  margin-top:4px;
  justify-content:center ;
  font-family: 'Arial', sans-serif;
  padding: 0px;
  margin-left: 10px;
  font-size: 16px;
  border-radius: 5px;
}
.descricao h5{
  align-self: center;
  color: #11324e;
  margin-left: 10px;
  font-weight: 600;
  font-size: 16px;
}
.desenvolvedor{
  background-color: rgba(142, 142, 159, 0);
  border-radius: 5px;
  height:50%;
  width:300%;
  margin-top:35px;
  display: flex;
  position: absolute;
}
.desenvolvedor h4{
  color: #5397d0;
  text-align: center;
  margin-top:0px;
  justify-content:center ;
  font-family: 'Arial', sans-serif;
  padding: 0px;
  margin-left: 10px;
  font-size: 16px;
  border-radius: 5px;
}
.desenvolvedor h5{
  align-self: center;
  color: #11324e;
  margin-left: 10px;
  font-weight: 600;
  font-size: 16px;
}
.suporte{
  background-color: rgba(142, 142, 159, 0);
  border-radius: 5px;
  height:50%;
  width:150%;
  margin-top:69px;
  display: flex;
  position: absolute;
}
.suporte h4{
  color: #5397d0;
  text-align: center;
  margin-top:0px;
  justify-content:center ;
  font-family: 'Arial', sans-serif;
  padding: 0px;
  margin-left: 10px;
  font-size: 16px;
  border-radius: 5px;
}
.suporte h5{
  align-self: center;
  color: #11324e;
  margin-left: 10px;
  font-weight: 600;
  font-size: 16px;
}
.revisor{
  background-color: rgba(142, 142, 159, 0);
  border-radius: 5px;
  height:50%;
  width:300%;
  margin-top:104px;
  display: flex;
  position: absolute;
}
.revisor h4{
  color: #5397d0;
  text-align: center;
  margin-top:0px;
  justify-content:center ;
  font-family: 'Arial', sans-serif;
  padding: 0px;
  margin-left: 10px;
  font-size: 16px;
  border-radius: 5px;
}
.revisor h5{
  align-self: center;
  color: #11324e;
  margin-left: 10px;
  font-weight: 600;
  font-size: 16px;
}
.data{
  background-color: rgba(142, 142, 159, 0);
  border-radius: 5px;
  height:50%;
  width:100%;
  margin-top:140px;
  display: flex;
  position: absolute;
}
.data h4{
  color: #5397d0;
  text-align: center;
  margin-top:0px;
  justify-content:center ;
  font-family: 'Arial', sans-serif;
  padding: 0px;
  margin-left: 5px;
  font-size: 16px;
  border-radius: 5px;
}
.data h5{
  align-self: center;
  color: #11324e;
  margin-left: 10px;
  font-weight: 600;
  font-size: 16px;
}





.pushable {
  background: rgb(36, 104, 160);
  border-radius: 5px;
  position: absolute;
  border: 3px solid #00027c69;
  padding: 0;
  cursor: pointer;
  width: 10%;
  margin-left: 55%;
  margin-top: 11%;
  outline-offset: 4px;
  justify-content: right;
}

.front {
  display: block;
  border-radius: 5px;
  padding: 5px;
  font-size: 1.25rem;
  background: #5397d0;
  color: white;
  text-align: center;
  transform: translateY(-8px);
}

.pushable:active .front {
  transform: translateY(-2px);
}
</style>
