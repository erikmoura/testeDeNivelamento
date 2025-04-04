<script lang="ts">
import { ref, onMounted } from 'vue'
import axios from 'axios'
export default {
  name: 'TabelaResultados',
  setup() {
    interface Relatorio {
      id: number;
      Registro_ANS: string;
      CNPJ: string;
      Razao_Social: string;
      Modalidade: string;
      Cidade: string;
      UF: string;
      Telefone: string;
    }

    const relatorios = ref<Relatorio[]>([])

    onMounted(async () => {
      const res = await axios.get('http://localhost:8001/api/relatorios/')
      relatorios.value = res.data
    })

    return {
      relatorios,
    }
  },
}
</script>

<template>
  <div class="scroll-table">
    <table >
        <thead class="table-header">
          <tr>
            <th>Registro ANS</th>
            <th>CNPJ</th>
            <th>Razão Social</th>
            <th>Modalidade</th>
            <th>Cidade</th>
            <th>Telefone</th>
          </tr>
        </thead>
        <tbody class="table-content">
          <tr v-for="relatorio in relatorios" :key="relatorio.id">
            <td>{{ relatorio.Registro_ANS }}</td>
            <td>{{ relatorio.CNPJ }}</td>
            <td>{{ relatorio.Razao_Social }}</td>
            <td>{{ relatorio.Modalidade }}</td>
            <td>{{ relatorio.Cidade }}</td>
            <td>{{ relatorio.Telefone }}</td>
          </tr>
        </tbody>
      </table>
  </div>
</template>

<style lang="css" scoped>
.scroll-table{
  display: flex;
  flex-direction: column;
  max-height: calc(100vh - 210px);
  overflow-y: auto;
  scrollbar-width: thin;
  height: 100%;
  width: 100%;
  background-color: #ffffff;
  padding-top: 10px;
}
.table-header{
  font-family: 'Montserrat', sans-serif;
  font-size: 15px;
  font-weight: 50;
  text-align: center;
  margin-top: 500px;

}
.table-content{
  font-family: 'Montserrat', sans-serif;
  font-size: 15px;
  font-weight: 250;
  text-align: center;
  padding-left: 10px;
  padding-right: 10px;
}

</style>
