<template>
  <div class="q-pa-md">
    <q-btn label="Nuevo Estudiante" color="primary" @click="abrirDialogo()" />

    <q-table
      :rows="estudiantes"
      :columns="columnas"
      row-key="id"
      class="q-mt-md"
      flat
      bordered
      dense
    >
      <template v-slot:body-cell-foto="props">
        <q-td :props="props">
          <q-avatar size="50px">
            <img
              v-if="props.row.foto"
              :src="`http://localhost:8000/storage/images/${props.row.foto}`"
              alt="Foto"
            />
            <q-icon v-else name="person" />
          </q-avatar>
        </q-td>
      </template>

      <template v-slot:body-cell-actions="props">
        <q-td :props="props" class="row items-center q-gutter-sm justify-end">
          <q-btn
            dense
            flat
            round
            color="primary"
            icon="visibility"
            @click="abrirDialogoVer(props.row)"
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
            @click="eliminarEstudiante(props.row.id)"
            title="Eliminar"
          />
        </q-td>
      </template>
    </q-table>

    <!-- Diálogo para crear/editar -->
    <q-dialog v-model="dialogoVisible" persistent>
      <q-card style="min-width: 400px;">
        <q-card-section>
          <div class="text-h6">
            {{ modoEdicion ? 'Editar Estudiante' : 'Nuevo Estudiante' }}
          </div>
        </q-card-section>

        <q-card-section>
          <q-form @submit.prevent="guardarEstudiante" ref="formRef">
            <q-input
              v-model="form.nombre"
              label="Nombre"
              required
              autofocus
              class="q-mb-sm"
            />
            <q-input
              v-model="form.matricula"
              label="Matrícula"
              required
              class="q-mb-sm"
            />
            <q-input
              v-model="form.direccion"
              label="Dirección"
              class="q-mb-sm"
            />
            <q-input
              v-model="form.contacto"
              label="Contacto"
              class="q-mb-sm"
            />
            <q-uploader
              accept="image/*"
              label="Foto"
              @added="onFotoSeleccionada"
              :auto-upload="false"
              max-files="1"
              class="q-mb-sm"
            />

            <div v-if="form.foto" class="q-mb-sm">
              <q-img
                :src="`http://localhost:8000/storage/images/${form.foto}`"
                alt="Foto actual"
                style="max-width: 150px;"
              />
            </div>

            <q-card-actions align="right">
              <q-btn flat label="Cancelar" color="secondary" @click="dialogoVisible = false" />
              <q-btn label="Guardar" color="primary" type="submit" />
            </q-card-actions>
          </q-form>
        </q-card-section>
      </q-card>
    </q-dialog>

    <!-- Diálogo solo para ver -->
    <q-dialog v-model="dialogoVerVisible" persistent>
      <q-card style="min-width: 400px;">
        <q-card-section>
          <div class="text-h6">Detalle Estudiante</div>
        </q-card-section>

        <q-card-section>
          <div><strong>Nombre:</strong> {{ formVer.nombre }}</div>
          <div><strong>Matrícula:</strong> {{ formVer.matricula }}</div>
          <div><strong>Dirección:</strong> {{ formVer.direccion }}</div>
          <div><strong>Contacto:</strong> {{ formVer.contacto }}</div>
          <div v-if="formVer.foto" class="q-mt-md">
            <q-img
              :src="`http://localhost:8000/storage/images/${formVer.foto}`"
              alt="Foto"
              style="max-width: 150px;"
            />
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

const estudiantes = ref([])
const dialogoVisible = ref(false)
const dialogoVerVisible = ref(false)
const modoEdicion = ref(false)

const form = ref({
  id: null,
  nombre: '',
  matricula: '',
  direccion: '',
  contacto: '',
  foto: null,
  fotoArchivo: null,
})

const formVer = ref({
  nombre: '',
  matricula: '',
  direccion: '',
  contacto: '',
  foto: null,
})

const columnas = [
  { name: 'nombre', label: 'Nombre', field: 'nombre', sortable: true },
  { name: 'matricula', label: 'Matrícula', field: 'matricula', sortable: true },
  { name: 'direccion', label: 'Dirección', field: 'direccion', sortable: true },
  { name: 'contacto', label: 'Contacto', field: 'contacto', sortable: true },
  { name: 'foto', label: 'Foto', field: 'foto' },
  { name: 'actions', label: 'Acciones', field: 'actions', sortable: false },
]

function limpiarFormulario() {
  form.value = {
    id: null,
    nombre: '',
    matricula: '',
    direccion: '',
    contacto: '',
    foto: null,
    fotoArchivo: null,
  }
}

function abrirDialogo(estudiante = null) {
  if (estudiante) {
    modoEdicion.value = true
    form.value = { ...estudiante, fotoArchivo: null }
  } else {
    modoEdicion.value = false
    limpiarFormulario()
  }
  dialogoVisible.value = true
}

function abrirDialogoVer(estudiante) {
  formVer.value = { ...estudiante }
  dialogoVerVisible.value = true
}

function onFotoSeleccionada(files) {
  if (files.length > 0) {
    form.value.fotoArchivo = files[0]
  }
}

async function cargarEstudiantes() {
  try {
    const { data } = await axios.get('http://localhost:8000/api/estudiantes')
    estudiantes.value = data
  } catch (error) {
    alert(error.response?.data?.message || 'Error al cargar estudiantes')
  }
}

async function guardarEstudiante() {
  try {
    const formData = new FormData()
    formData.append('nombre', form.value.nombre)
    formData.append('matricula', form.value.matricula)
    formData.append('direccion', form.value.direccion)
    formData.append('contacto', form.value.contacto)
    if (form.value.fotoArchivo) {
      formData.append('foto', form.value.fotoArchivo)
    }

    if (modoEdicion.value) {
      await axios.post(
        `http://localhost:8000/api/estudiantes/${form.value.id}?_method=PUT`,
        formData,
        { headers: { 'Content-Type': 'multipart/form-data' } }
      )
      alert('Estudiante actualizado')
    } else {
      await axios.post('http://localhost:8000/api/estudiantes', formData, {
        headers: { 'Content-Type': 'multipart/form-data' },
      })
      alert('Estudiante creado')
    }

    dialogoVisible.value = false
    cargarEstudiantes()
  } catch (error) {
    alert(error.response?.data?.message || 'Error al guardar estudiante')
  }
}

async function eliminarEstudiante(id) {
  if (!confirm('¿Seguro que desea eliminar este estudiante?')) return

  try {
    await axios.delete(`http://localhost:8000/api/estudiantes/${id}`)
    alert('Estudiante eliminado')
    cargarEstudiantes()
  } catch (error) {
    alert(error.response?.data?.message || 'Error al eliminar estudiante')
  }
}

onMounted(() => {
  cargarEstudiantes()
})
</script>
