<template>
  <div class="q-pa-md flex flex-center" style="height: 100vh;">
    <q-card class="q-pa-lg" style="min-width: 350px; width: 100%; max-width: 400px;">
      <q-card-section>
        <div class="text-h6">Iniciar Sesión</div>
        <q-input v-model="usuario" label="Correo" type="email" class="q-mb-sm" />
        <q-input v-model="clave" label="Clave" type="password" class="q-mb-sm" />
        <q-btn label="Entrar" @click="login" color="primary" class="full-width" />
      </q-card-section>
    </q-card>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'

// API base URL de tu backend Laravel
const api = axios.create({
  baseURL: 'http://localhost:8000/api' // Ajusta el puerto y URL si es diferente
})

const usuario = ref('')
const clave = ref('')
const router = useRouter()

async function login() {
  try {
    const response = await api.post('/login', {
      correo: usuario.value,
      password: clave.value
    })
    // Guardamos en localStorage que el usuario está autenticado y datos del usuario
    localStorage.setItem('auth', 'true')
    localStorage.setItem('user', JSON.stringify(response.data.usuario))
    router.push('/usuarios')
  } catch (error) {
    if (error.response && error.response.status === 401) {
      alert('Credenciales incorrectas')
    } else if (error.response && error.response.data && error.response.data.message) {
      alert('Error: ' + error.response.data.message)
    } else {
      alert('Error de conexión. Intenta de nuevo.')
    }
  }
}
</script>
