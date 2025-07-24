import { createApp } from 'vue'
import App from './App.vue'
import router from './router' 

import axios from 'axios'  
import { Quasar } from 'quasar'
import quasarUserOptions from './quasar-user-options' 

const app = createApp(App)

app.use(router)
app.use(Quasar, quasarUserOptions)

app.config.globalProperties.$axios = axios

app.mount('#q-app')
