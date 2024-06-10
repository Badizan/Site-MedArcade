<template >
<div class="body-index">
  <div class="quadrado-branco">
    <main>
      <article> 
        <div class="header">
          <h2><span>Med</span><span>Arcade</span></h2>
          <nuxt-link to="info/innovamed" class="inova">InnovaMed</nuxt-link>
         </div>
         <div class="text-cima">
          <p class="escolha">
            Faça sua escolha entre as diversas categorias disponíveis no MedArcade para aprender hoje.
          </p>
          <p class="disponibilidade">Selecione a categoria:</p>
        </div>
         <div class="window">
          <div class="scene">
            <ul class="grid" id="category-list">
              <li v-for="categoria in categorias" :key="categoria.nome" class="categoria-li">
                  <nuxt-link :to="'/categoria/' + categoria.id">
                <div class="item-index">
                  <div class="item_icon">
                    <img :src="categoria.icon" :alt="categoria.alt" />
                  </div>
                  <div class="item_text">{{ categoria.nome }}</div>
                </div>
              </nuxt-link>
              </li>
            </ul>
          </div>
        </div>
      
        
      </article>
    </main>
  </div>
</div>
</template>

<script>
import categoria from "~/database/categorias.js";
export default {
  data() {
    return {
      categorias: categoria,

      link: [
        {
          rel: 'stylesheet',
          href: 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css',
          integrity: 'sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==',
          crossorigin: 'anonymous',
          referrerpolicy: 'no-referrer'
        }
      ]
    };
  },
};
</script>


<style>
         /*<img
            src="~/static/img/logo_centro universitario integrado-02.png"
            class="logo"
            alt="Logo"
          />
.logo {
    position: absolute; 
    top: 0.5rem; 
    left: 1rem; 
    width: 40px;
    height: 70px;
    z-index: 10;
    display: inline-block;
    margin-right: auto;
}*/

@font-face {
    font-family: "Geist Sans";
    src: url("https://assets.codepen.io/605876/GeistVF.ttf") format("truetype");
  }
  
  *,
  *:after,
  *:before {
      box-sizing: border-box;
  }


  .escolha {
    justify-content: center;
    position: relative;
    color: #11324e; 
    font-weight: 960;
    font-size: 16px;
   }

  :root {
      --speed: 4s;
      --transition: 0.15s;
  }
  .text-cima {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  margin-top: 1rem;
  width: 100%;
  box-shadow: 0 10px 10px -2px #5c5b5b3f;
  padding-bottom: 1rem;
}

.disponibilidade {
  color: #5397d0;
  font-weight: 660;
  font-size: 16px;
  margin-top: 0.5rem; /* Ajuste da margem superior */
  margin-bottom: 0; /* Remove a margem inferior */
}

  .quadrado-branco {
  position: absolute;
  top: 50%;
  left: 45%;
  transform: translate(-50%, -50%);
  background: linear-gradient(0, #c9dff1, #ffffff);
}

  
  article {
    width: 120%;
    position: relative;
    box-shadow: 0 10px 20px -5px #5397d0;
    border: 1px solid #bacddd;
    border-radius: 10px;
    background: hsl(0, 0%, 100%);
    max-width: min(calc(1000px + 8rem), calc(100vw - 2rem));
    max-height: 680px;
    min-width: 340px;
    text-decoration: none;
}
  h2 {
      display: flex;
      font-size: clamp(1.5rem, 4cqi + 1rem, 3rem);
      font-weight: 160;
      color: #11324e !important;
      position: relative;
      margin-top:1.5rem;
      margin-left: 2rem;
      grid-column: 1 / -1;
      justify-content: center;
      display: flex;
      align-items: center;
  }
  
  h2 span:last-of-type {
      display: inline-block;
      background: linear-gradient(to right, #c9dff1, #c9dff1, #c9dff1, #5397d0, #11324e, #5397d0, #c9dff1, #c9dff1, #c9dff1) 0 0 / 400% 100% no-repeat;
      background-clip: text;
      color: transparent;
      animation: shade 8s infinite linear;
  }
  
  
  @keyframes shade {
      to {
          background-position: 100% 0;
          background-color: #000000
      }
  }
  
  .header {
    display: flex;
    flex-direction: row; 
    align-items: center; 
    justify-content: space-between; 
    gap: 2rem;
    width: 100%;
    color: #000000;
    font-family: "Geist Sans", "SF Pro Text", "SF Pro Icons", "AOS Icons", "Helvetica Neue", Helvetica, Arial, sans-serif, system-ui;
    margin-bottom: 1rem;
    font-size: 16px;
    font-weight: 80;
    transition: opacity 0.5s;
    text-decoration: none;
    
    
    
}
  
  article .inova {
  font-family: 'Arial', sans-serif;
  text-decoration: none;
  padding: 0.5rem 1rem;
  border-bottom: 2px solid #5397d0;
  text-decoration: none;
  line-height: 10px;
  color: #5397d0;
  font-weight: 960;
  cursor: pointer;
  margin-top:40px;
  margin-right:20px;
}
article .inova:hover{
  border-bottom: 2px solid #d0e4f5;
}
  
  article a {
      align-self: flex-start;
      text-decoration: none;
      justify-self: end;
      padding: 0.5rem 1.5rem;
      color: hsl(238, 100%, 14%);
      font-weight: 120;
      cursor: pointer;
  }
  
  
  p {
      margin: 0;
      text-decoration: none;
  }
  
  /*.sr-only {
      position: absolute;
      width: 1px;
      height: 1px;
      padding: 0;
      margin: -1px;
      overflow: hidden;
      clip: rect(0, 0, 0, 0);
      white-space: nowrap;
      border-width: 0;
  }*/
  
   
  
  
  label, input {
      accent-color: #1e00ff;
      cursor: pointer;
  }
  
  /*	border: 2px solid red;*/
  .window {
      height: 500px;
      container-type: inline-size;
      transform-style: preserve-3d;
      width: 100%;
      outline: 4px dashed transparent;
      transition: outline 0.5s;
      background-color: rgba(208, 233, 255, 0.271);
      
  }
  
  .scene {
      --buff: 1rem;
      margin-top: 10px;
      height: 90%;
      width: 100%;
      mask:
          linear-gradient(transparent, rgb(255, 255, 255) var(--buff) calc(100% - var(--buff)), transparent),
          linear-gradient(90deg, transparent, rgb(255, 255, 255) var(--buff) calc(100% - var(--buff)), transparent);
      mask-composite: intersect;
  }
  
  
  .grid {
    overflow-y: auto; /* Adiciona scroll vertical quando necessário */
    --count: 6;
    scrollbar-width: thin; 
   scrollbar-color: #5397d0 rgba(208, 233, 255, 0.271);
    --inset: 1;
    --outset: 2.5;
    height: calc(100% - 50px); /* Ajusta a altura da lista de categorias */
    width: 100%;
    margin: 0;
    list-style-type: none;
    position: absolute;
    display: grid;
    padding: 0 1rem;
    grid-template-columns: repeat(2, 1fr);
    gap: 0 2rem;
    transition: transform 0.5s;
    /* 3D translation */
    transform:
        rotateX(calc(var(--rotate, 0) * 20deg))
        rotateZ(calc(var(--rotate, 0) * -20deg))
        skewX(calc(var(--rotate, 0) * 20deg));
} 
  :root:has(#dimension:checked) .grid {
      --rotate: 1;
  }
  
  li {
  min-height: 70px;
  margin-left: 2rem;
  transform-style: preserve-3d;
  width: 90%;
  text-decoration: none;
  z-index: calc(1 + var(--active));
  }
  li::before {
  content: "";
  position: absolute;
  inset: 0px 0px -30px 0px;
  border-radius: 10px;
  text-decoration: none;
  background: #4baeff9d;
  filter: blur(calc(var(--active, 0) * 8px));
  z-index: -1;
  margin-top: 25px;
  transition: scale var(--transition), opacity var(--transition), translate var(--transition), filter var(--transition);
  transform-origin: 50% 0;
  scale: 1 calc(1 + (var(--active, 0) * 0.05));
  --tw-shadow: 0 6px 8px -2px rgb(0 0 0 / 0.1);
  box-shadow: 0 6px 8px -2px rgb(0 0 0 / 0.1);
  }
  
  .item-index {
  align-items: center;
  background: #ffffff;
  border: 1px solid hsl(0, 0%, 100%);
  color: #002d55;
  border-radius: 6px;
  cursor: pointer;
  display: flex;
  margin-top:0px;
  gap: 1rem;
  height: 100%;
  justify-content: flex-start;
  overflow: hidden;
  padding: 1.25rem;
  text-align: center;
  width: 100%;
  transition: background-color 0.25s, color 0.25s, border 0.25s, box-shadow 0.25s;
}
  .item_icon {
      position: relative;
      top:2px;
      
  }
  .item_icon img {
  width: 40px;
  height: 40px;
}
  .item_text {
      flex: 1;
      text-align: center;
      font-weight: 600;
  }

  
 
  
  @media(prefers-reduced-motion: no-preference) {
  .grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
  }

  li {
    animation: none;
  }

  li:hover {
    --active: 2;
  }
}

@media (max-width: 768px) {
  .quadrado-branco {
    overflow-y: hidden;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
  }

  article {
    width: 100%;
    max-width: 100%;
    min-width: auto;
    border-radius: 0;
    box-shadow: none;
  }

  .grid {
    grid-template-columns: repeat(1, 1fr);
  }
  .grid li{
   margin-top:10px;
    margin-left:20px;
  }

  .item-index {
    padding: 1rem;
  }

  h2 span {
    margin-top:13px;

  }
  
  header h2{
    margin-left: -20px;
  }

  .inova {
    align-content: center;
    margin-bottom: 0px;
  }

  .escolha{
    margin-top:-20px;
  }
}
</style>
