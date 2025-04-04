<script setup lang="ts">
import { ref } from 'vue'
import axios from 'axios'
import TabelaResultados from './TabelaResultados.vue'
import DetalhesRegistro from './DetalhesRegistro.vue'

const busca = ref('')
const resultadoBusca = ref(null)
const mostrarModal = ref(false)

const buscar = async () => {
  try {
    const res = await axios.get(`http://localhost:8001/api/relatorios/${busca.value}/`)
    resultadoBusca.value = res.data
    mostrarModal.value = true
  } catch (err) {
    resultadoBusca.value = null
    alert('Registro não encontrado')
  }
}

const fecharModal = () => {
  mostrarModal.value = false
}
</script>
<template>
  <div class="search-area">
    <div class="navbar">
      <img class="logo" src="../assets/logo_intuitive.png" alt="logo" width="50" height="50" />
      <h1 class="title">Busca Textual</h1>
    </div>
    <div style="display: flex; position: relative; top: -180px">
      <input v-model="busca" placeholder="Buscar por registro ANS" class="search-input" />
      <CIcon icon="cilSearch" class="icon" @click="buscar" />
    </div>
    <div style="position: absolute; top: 200px">
      <TabelaResultados />
    </div>
    <DetalhesRegistro
      v-if="mostrarModal"
      :registro="resultadoBusca"
      :fechar="fecharModal"
    />
  </div>
</template>

<style lang="css" scoped>
.search-area {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background-color: #f4eafc;
}
.navbar {
  display: flex;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  align-items: center;
  background-color: #daa0fb;
}
.logo {
  margin-left: 25px;
  margin-right: 25px;
}
.title {
  font-family: 'Montserrat', sans-serif;
  font-size: 30px;
  font-weight: 500;
  color: #9851f1;
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.75);
}
.search-input {
  min-width: 350px;
  max-width: 600px;
  height: 50px;
  border-radius: 50px;
  border: none;
  padding-left: 20px;
  font-size: 16px;
  font-family: 'Montserrat', sans-serif;
  color: #9851f1;
  box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.1);
}
.icon {
  width: 30px;
  height: 30px;
  opacity: 40%;
  position: relative;
  left: -50px;
  top: 10px;
  cursor: pointer;
}
</style>
