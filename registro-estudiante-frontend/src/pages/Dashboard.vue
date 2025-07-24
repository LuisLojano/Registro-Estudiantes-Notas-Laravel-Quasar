<template>
  <q-page padding>
    <div class="row q-col-gutter-md">
      <!-- Tarjetas de totales -->
      <q-card class="col-12 col-sm-4 q-pa-md">
        <div class="text-h6">Total Estudiantes</div>
        <div class="text-h3 text-primary">{{ totalEstudiantes }}</div>
      </q-card>

      <q-card class="col-12 col-sm-4 q-pa-md">
        <div class="text-h6">Total Notas</div>
        <div class="text-h3 text-secondary">{{ totalNotas }}</div>
      </q-card>

      <q-card class="col-12 col-sm-4 q-pa-md">
        <div class="text-h6">Total Usuarios</div>
        <div class="text-h3 text-accent">{{ totalUsuarios }}</div>
      </q-card>
    </div>

    <q-banner class="q-my-md" dense>
      Listado de estudiantes recientes
    </q-banner>

    <!-- Tabla de estudiantes -->
    <q-table
      :columns="columns"
      :rows="estudiantes"
      row-key="id"
      flat
      bordered
      :pagination="{ rowsPerPage: 5 }"
    >
      <template v-slot:body-cell-foto="props">
        <q-avatar size="40px">
          <img :src="props.row.foto || 'https://cdn.quasar.dev/img/avatar.png'" />
        </q-avatar>
      </template>
    </q-table>
  </q-page>
</template>

<script setup>
import { ref } from 'vue'

// Datos simulados (luego los traeremos de backend)
const totalEstudiantes = ref(12)
const totalNotas = ref(56)
const totalUsuarios = ref(3)

const estudiantes = ref([
  { id: 1, nombre: 'Luis Lojano', matricula: '2021001', direccion: 'Machala', contacto: '0991234567', foto: '' },
  { id: 2, nombre: 'Ana Pérez', matricula: '2021002', direccion: 'Guayaquil', contacto: '0987654321', foto: '' },
  { id: 3, nombre: 'Carlos Ruiz', matricula: '2021003', direccion: 'Quito', contacto: '0971122334', foto: '' },
])

const columns = [
  { name: 'foto', label: 'Foto', field: 'foto', sortable: false },
  { name: 'nombre', label: 'Nombre', field: 'nombre', sortable: true },
  { name: 'matricula', label: 'Matrícula', field: 'matricula', sortable: true },
  { name: 'direccion', label: 'Dirección', field: 'direccion', sortable: true },
  { name: 'contacto', label: 'Contacto', field: 'contacto', sortable: true },
]
</script>
