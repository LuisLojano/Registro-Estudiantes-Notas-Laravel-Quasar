<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-btn flat dense round icon="menu" aria-label="Menu" @click="toggleLeftDrawer" />
        <q-toolbar-title>Registro de Estudiantes</q-toolbar-title>
        <q-space />
        <q-btn flat icon="logout" label="Salir" @click="logout" />
      </q-toolbar>
    </q-header>

    <q-drawer v-model="leftDrawerOpen" show-if-above bordered>
      <q-list>
        <q-item-label header> Menú </q-item-label>

        <q-item clickable to="/usuarios" active-class="q-item--active">
          <q-item-section avatar><q-icon name="person" /></q-item-section>
          <q-item-section>Usuarios</q-item-section>
        </q-item>

        <q-item clickable to="/estudiantes" active-class="q-item--active">
          <q-item-section avatar><q-icon name="school" /></q-item-section>
          <q-item-section>Estudiantes</q-item-section>
        </q-item>

        <q-item clickable to="/notas" active-class="q-item--active">
          <q-item-section avatar><q-icon name="grading" /></q-item-section>
          <q-item-section>Notas</q-item-section>
        </q-item>
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const leftDrawerOpen = ref(false)
const router = useRouter()

function toggleLeftDrawer() {
  leftDrawerOpen.value = !leftDrawerOpen.value
}

function logout() {
  localStorage.removeItem('auth')
  router.push('/login')
}
</script>
