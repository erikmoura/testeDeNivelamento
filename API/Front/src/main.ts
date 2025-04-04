import { createApp } from 'vue'
import App from './App.vue'
import { CIcon } from '@coreui/icons-vue'
import { cilSearch } from '@coreui/icons'

const icons = {
  cilSearch,
}

const app = createApp(App)
app.provide('icons', icons)
app.component('CIcon', CIcon)
app.mount('#app')
