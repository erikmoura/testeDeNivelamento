<template>
  <div class="modal-overlay" @click.self="fechar">
    <div class="modal-content">
      <h2>Detalhes sobre o registro:</h2>
      <p>Registro ANS: {{ registro.Registro_ANS }}</p>
      <p>CNPJ: {{ registro.CNPJ }}</p>
      <p>Razão Social: {{ registro.Razao_Social }}</p>
      <p>Modalidade: {{ registro.Modalidade }}</p>
      <p>Cidade: {{ registro.Cidade }}</p>
      <p>Telefone: {{ registro.Telefone }}</p>
      <button class="fechar-btn" @click="fechar">Fechar</button>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  registro: any,
  fechar: () => void
}>()
</script>

<style scoped>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal-content {
  background-color: white;
  padding: 30px;
  border-radius: 30px;
  max-width: 600px;
  width: 90%;
  max-height: 80vh;
  overflow-y: auto;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
  font-family: 'Montserrat', sans-serif;

}

.fechar-btn {
  margin-top: 20px;
  background-color: #9851f1;
  box-shadow: 0px 3px 0px rgba(0, 0, 0, 0.1);
  font-family: 'Montserrat', sans-serif;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 30px;
  cursor: pointer;
  left: 500px;
  position: relative;
}
</style>
