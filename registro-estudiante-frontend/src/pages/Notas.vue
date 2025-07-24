<template>
  <div class="q-pa-md">
    <q-btn label="Nueva Nota" color="primary" @click="abrirDialogo()" />

    <q-table
      :rows="notas"
      :columns="columnas"
      row-key="id"
      flat
      bordered
      dense
      class="q-mt-md"
    >
      <template v-slot:body-cell-estudiante_id="props">
        <q-td :props="props">
          {{ props.row.estudiante ? props.row.estudiante.nombre : 'Sin estudiante' }}
        </q-td>
      </template>

      <template v-slot:body-cell-promedio="props">
        <q-td :props="props">
          <q-chip
            :color="getColorPromedio(promedio(props.row))"
            text-color="white"
            dense
          >
            {{ promedio(props.row).toFixed(2) }}
          </q-chip>
        </q-td>
      </template>

      <template v-slot:body-cell-acciones="props">
        <q-td :props="props" class="row items-center q-gutter-sm justify-end">
          <q-btn
            dense
            flat
            round
            color="primary"
            icon="visibility"
            @click="verNota(props.row)"
            title="Ver"
          />
          <q-btn
            dense
            flat
            round
            color="primary"
            icon="edit"
            @click="abrirDialogo(props.row)"
            title="Editar"
          />
          <q-btn
            dense
            flat
            round
            color="negative"
            icon="delete"
            @click="eliminarNota(props.row.id)"
            title="Eliminar"
          />
        </q-td>
      </template>
    </q-table>

    <!-- Dialogo para crear/editar nota -->
    <q-dialog v-model="dialogoVisible" persistent>
      <q-card style="min-width: 450px;">
        <q-card-section>
          <div class="text-h6">
            {{ modoEdicion ? 'Editar Nota' : 'Nueva Nota' }}
          </div>
        </q-card-section>

        <q-card-section>
          <q-form @submit.prevent="guardarNota" ref="formRef">
            <q-select
              v-model="form.estudiante_id"
              :options="estudiantesOptions"
              option-label="nombre"
              option-value="id"
              label="Estudiante"
              emit-value
              map-options
              required
              class="q-mb-sm"
            />

            <div
              v-for="(materia, index) in materias"
              :key="index"
              class="q-mb-sm row q-col-gutter-sm"
            >
              <div class="col-6">
                <q-input
                  v-model.number="form[materia.p1]"
                  label="Parcial 1 - {{ materia.nombre }}"
                  type="number"
                  min="0"
                  max="100"
                  required
                />
              </div>
              <div class="col-6">
                <q-input
                  v-model.number="form[materia.p2]"
                  label="Parcial 2 - {{ materia.nombre }}"
                  type="number"
                  min="0"
                  max="100"
                  required
                />
              </div>
            </div>

            <q-card-actions align="right">
              <q-btn
                flat
                label="Cancelar"
                color="secondary"
                @click="dialogoVisible = false"
              />
              <q-btn label="Guardar" color="primary" type="submit" />
            </q-card-actions>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

    <!-- Dialogo para ver nota -->
    <q-dialog v-model="dialogoVerVisible" persistent>
      <q-card style="min-width: 350px;">
        <q-card-section class="row items-center">
          <q-avatar size="80px" class="q-mr-md">
            <img
              :src="notaVer.estudiante?.foto
                ? `http://localhost:8000/storage/images/${notaVer.estudiante.foto}`
                : 'https://cdn.quasar.dev/img/boy-avatar.png'"
              alt="Foto Estudiante"
            />
          </q-avatar>
          <div>
            <div class="text-h6">{{ notaVer.estudiante?.nombre || 'Sin Estudiante' }}</div>
            <div>Promedio final:</div>
            <q-chip
              :color="getColorPromedio(promedio(notaVer))"
              text-color="white"
              dense
              class="q-mt-xs"
            >
              {{ promedio(notaVer).toFixed(2) }}
            </q-chip>
          </div>
        </q-card-section>
        <q-card-actions align="right">
          <q-btn flat label="Cerrar" color="primary" @click="dialogoVerVisible = false" />
        </q-card-actions>
      </q-card>
    </q-dialog>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const notas = ref([])
const estudiantesOptions = ref([])
const dialogoVisible = ref(false)
const dialogoVerVisible = ref(false)
const modoEdicion = ref(false)

const form = ref({
  id: null,
  estudiante_id: null,
  matematicas_p1: 0,
  matematicas_p2: 0,
  lengua_p1: 0,
  lengua_p2: 0,
  ciencias_p1: 0,
  ciencias_p2: 0,
  sociales_p1: 0,
  sociales_p2: 0,
  ingles_p1: 0,
  ingles_p2: 0,
})

const notaVer = ref({})

const columnas = [
  { name: 'estudiante_id', label: 'Estudiante', field: 'estudiante_id', sortable: true },
  { name: 'matematicas_p1', label: 'Matemáticas P1', field: 'matematicas_p1' },
  { name: 'matematicas_p2', label: 'Matemáticas P2', field: 'matematicas_p2' },
  { name: 'lengua_p1', label: 'Lengua P1', field: 'lengua_p1' },
  { name: 'lengua_p2', label: 'Lengua P2', field: 'lengua_p2' },
  { name: 'ciencias_p1', label: 'Ciencias P1', field: 'ciencias_p1' },
  { name: 'ciencias_p2', label: 'Ciencias P2', field: 'ciencias_p2' },
  { name: 'sociales_p1', label: 'Sociales P1', field: 'sociales_p1' },
  { name: 'sociales_p2', label: 'Sociales P2', field: 'sociales_p2' },
  { name: 'ingles_p1', label: 'Inglés P1', field: 'ingles_p1' },
  { name: 'ingles_p2', label: 'Inglés P2', field: 'ingles_p2' },
  { name: 'promedio', label: 'Promedio Final', field: 'promedio' },
  { name: 'acciones', label: 'Acciones', field: 'acciones', sortable: false },
]

const materias = [
  { nombre: 'Matemáticas', p1: 'matematicas_p1', p2: 'matematicas_p2' },
  { nombre: 'Lengua', p1: 'lengua_p1', p2: 'lengua_p2' },
  { nombre: 'Ciencias', p1: 'ciencias_p1', p2: 'ciencias_p2' },
  { nombre: 'Sociales', p1: 'sociales_p1', p2: 'sociales_p2' },
  { nombre: 'Inglés', p1: 'ingles_p1', p2: 'ingles_p2' },
]

function limpiarFormulario() {
  form.value = {
    id: null,
    estudiante_id: null,
    matematicas_p1: 0,
    matematicas_p2: 0,
    lengua_p1: 0,
    lengua_p2: 0,
    ciencias_p1: 0,
    ciencias_p2: 0,
    sociales_p1: 0,
    sociales_p2: 0,
    ingles_p1: 0,
    ingles_p2: 0,
  }
}

function abrirDialogo(nota = null) {
  if (nota) {
    modoEdicion.value = true
    form.value = { ...nota }
  } else {
    modoEdicion.value = false
    limpiarFormulario()
  }
  dialogoVisible.value = true
}

function promedio(nota) {
  if (!nota) return 0
  const total =
    nota.matematicas_p1 +
    nota.matematicas_p2 +
    nota.lengua_p1 +
    nota.lengua_p2 +
    nota.ciencias_p1 +
    nota.ciencias_p2 +
    nota.sociales_p1 +
    nota.sociales_p2 +
    nota.ingles_p1 +
    nota.ingles_p2
  return total / 10
}

function getColorPromedio(prom) {
  if (prom >= 7) return 'green'
  if (prom >= 4) return 'orange'
  return 'red'
}

async function cargarNotas() {
  try {
    const { data } = await axios.get('http://localhost:8000/api/notas')
    notas.value = data
  } catch (error) {
    alert(error.response?.data?.message || 'Error al cargar notas')
  }
}

async function cargarEstudiantes() {
  try {
    const { data } = await axios.get('http://localhost:8000/api/estudiantes')
    estudiantesOptions.value = data
  } catch (error) {
    alert(error.response?.data?.message || 'Error al cargar estudiantes')
  }
}

async function guardarNota() {
  try {
    if (modoEdicion.value) {
      await axios.put(
        `http://localhost:8000/api/notas/${form.value.id}`,
        form.value
      )
      alert('Nota actualizada')
    } else {
      await axios.post('http://localhost:8000/api/notas', form.value)
      alert('Nota creada')
    }
    dialogoVisible.value = false
    cargarNotas()
  } catch (error) {
    alert(error.response?.data?.message || 'Error al guardar nota')
  }
}

async function eliminarNota(id) {
  if (!confirm('¿Seguro que desea eliminar esta nota?')) return

  try {
    await axios.delete(`http://localhost:8000/api/notas/${id}`)
    alert('Nota eliminada')
    cargarNotas()
  } catch (error) {
    alert(error.response?.data?.message || 'Error al eliminar nota')
  }
}

function verNota(nota) {
  notaVer.value = nota
  dialogoVerVisible.value = true
}

onMounted(() => {
  cargarNotas()
  cargarEstudiantes()
})
</script>
