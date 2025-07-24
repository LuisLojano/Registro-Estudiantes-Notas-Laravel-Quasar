<template>
  <div class="q-pa-md">
    <q-btn label="Nuevo Usuario" color="primary" @click="abrirDialogo()" />

    <q-table
      :rows="usuarios"
      :columns="columnas"
      row-key="id"
      flat
      bordered
      dense
      class="q-mt-md"
    >
      <template v-slot:body-cell-foto="props">
        <q-td :props="props" class="text-center">
          <q-avatar size="40px">
            <img v-if="props.row.foto" :src="`/storage/images/${props.row.foto}`" alt="Foto" />
            <q-icon v-else name="person" />
          </q-avatar>
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
            @click="verUsuario(props.row)"
            title="Ver"
          />
          <q-btn
            dense
            flat
            round
            color="warning"
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
            @click="eliminarUsuario(props.row.id)"
            title="Eliminar"
          />
        </q-td>
      </template>
    </q-table>

    <!-- Dialogo para Crear/Editar -->
    <q-dialog v-model="dialogoVisible" persistent>
      <q-card style="min-width: 400px;">
        <q-card-section>
          <div class="text-h6">{{ modoEdicion ? 'Editar Usuario' : 'Nuevo Usuario' }}</div>
        </q-card-section>

        <q-card-section>
          <q-form @submit.prevent="guardarUsuario" ref="formRef">
            <q-input v-model="form.nombres" label="Nombres" required />
            <q-input v-model="form.apellidos" label="Apellidos" required />
            <q-input v-model="form.correo" label="Correo" type="email" required />
            <q-input v-model="form.telefono" label="Teléfono" />
            <q-input v-model="form.direccion" label="Dirección" />
            <q-input
              v-model="form.password"
              label="Contraseña"
              type="password"
              :required="!modoEdicion"
              :disable="modoEdicion"
              hint="Solo para nuevo usuario"
            />
            <q-select
              v-model="form.rol"
              label="Rol"
              :options="roles"
              required
            />
            <q-uploader
              label="Foto (opcional)"
              :auto-upload="false"
              :max-files="1"
              accept="image/*"
              @added="onFileAdded"
              no-thumbnails
              class="q-mt-sm"
            />
            <div v-if="form.fotoPreview" class="q-mt-sm">
              <img :src="form.fotoPreview" alt="Preview" style="max-width: 120px;" />
            </div>
          </q-form>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="Cancelar" color="secondary" @click="dialogoVisible = false" />
          <q-btn label="Guardar" color="primary" @click="guardarUsuario" />
        </q-card-actions>
      </q-card>
    </q-dialog>

    <!-- Dialogo para Ver Usuario -->
    <q-dialog v-model="verDialogoVisible" persistent>
      <q-card style="min-width: 350px;">
        <q-card-section class="row items-center q-pa-md">
          <q-avatar size="80px" class="q-mr-md">
            <img v-if="usuarioVer.foto" :src="`/storage/images/${usuarioVer.foto}`" alt="Foto Usuario" />
            <q-icon v-else name="person" size="80px" />
          </q-avatar>
          <div>
            <div><strong>Nombres:</strong> {{ usuarioVer.nombres }}</div>
            <div><strong>Apellidos:</strong> {{ usuarioVer.apellidos }}</div>
            <div><strong>Correo:</strong> {{ usuarioVer.correo }}</div>
            <div><strong>Teléfono:</strong> {{ usuarioVer.telefono || '-' }}</div>
            <div><strong>Dirección:</strong> {{ usuarioVer.direccion || '-' }}</div>
            <div><strong>Rol:</strong> {{ usuarioVer.rol }}</div>
          </div>
        </q-card-section>
        <q-card-actions align="right">
          <q-btn flat label="Cerrar" color="primary" @click="verDialogoVisible = false" />
        </q-card-actions>
      </q-card>
    </q-dialog>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const usuarios = ref([])
const dialogoVisible = ref(false)
const verDialogoVisible = ref(false)
const modoEdicion = ref(false)
const usuarioVer = ref({})
const roles = ['admin', 'usuario', 'otro'] // Ajusta según roles permitidos

const form = ref({
  id: null,
  nombres: '',
  apellidos: '',
  correo: '',
  telefono: '',
  direccion: '',
  password: '',
  rol: '',
  foto: null,
  fotoPreview: null,
})

const columnas = [
  { name: 'foto', label: 'Foto', field: 'foto', align: 'center' },
  { name: 'nombres', label: 'Nombres', field: 'nombres', sortable: true },
  { name: 'apellidos', label: 'Apellidos', field: 'apellidos', sortable: true },
  { name: 'correo', label: 'Correo', field: 'correo', sortable: true },
  { name: 'telefono', label: 'Teléfono', field: 'telefono' },
  { name: 'direccion', label: 'Dirección', field: 'direccion' },
  { name: 'rol', label: 'Rol', field: 'rol' },
  { name: 'acciones', label: 'Acciones', field: 'acciones', align: 'center' },
]

async function cargarUsuarios() {
  try {
    const res = await axios.get('http://localhost:8000/api/usuarios')
    usuarios.value = res.data
  } catch (error) {
    alert('Error cargando usuarios')
    console.error(error)
  }
}

function abrirDialogo(usuario = null) {
  if (usuario) {
    modoEdicion.value = true
    form.value = {
      id: usuario.id,
      nombres: usuario.nombres,
      apellidos: usuario.apellidos,
      correo: usuario.correo,
      telefono: usuario.telefono,
      direccion: usuario.direccion,
      password: '', // No mostrar ni modificar aquí la contraseña
      rol: usuario.rol,
      foto: null,
      fotoPreview: usuario.foto ? `/storage/images/${usuario.foto}` : null,
    }
  } else {
    modoEdicion.value = false
    form.value = {
      id: null,
      nombres: '',
      apellidos: '',
      correo: '',
      telefono: '',
      direccion: '',
      password: '',
      rol: '',
      foto: null,
      fotoPreview: null,
    }
  }
  dialogoVisible.value = true
}

function verUsuario(usuario) {
  usuarioVer.value = usuario
  verDialogoVisible.value = true
}

async function eliminarUsuario(id) {
  if (!confirm('¿Está seguro de eliminar este usuario?')) return
  try {
    await axios.delete(`http://localhost:8000/api/usuarios/${id}`)
    cargarUsuarios()
  } catch (error) {
    alert('Error al eliminar usuario')
    console.error(error)
  }
}

function onFileAdded(files) {
  if (files.length > 0) {
    form.value.foto = files[0]
    form.value.fotoPreview = URL.createObjectURL(files[0])
  } else {
    form.value.foto = null
    form.value.fotoPreview = null
  }
}

async function guardarUsuario() {
  if (
    !form.value.nombres ||
    !form.value.apellidos ||
    !form.value.correo ||
    !form.value.rol ||
    (!modoEdicion.value && !form.value.password)
  ) {
    alert('Por favor completa los campos requeridos')
    return
  }

  const formData = new FormData()
  formData.append('nombres', form.value.nombres)
  formData.append('apellidos', form.value.apellidos)
  formData.append('correo', form.value.correo)
  formData.append('telefono', form.value.telefono)
  formData.append('direccion', form.value.direccion)
  formData.append('rol', form.value.rol)
  if (!modoEdicion.value) formData.append('password', form.value.password)
  if (form.value.foto) formData.append('foto', form.value.foto)

  try {
    if (modoEdicion.value) {
      await axios.post(
        `http://localhost:8000/api/usuarios/${form.value.id}?_method=PUT`,
        formData,
        {
          headers: { 'Content-Type': 'multipart/form-data' },
        }
      )
    } else {
      await axios.post('http://localhost:8000/api/usuarios', formData, {
        headers: { 'Content-Type': 'multipart/form-data' },
      })
    }
    cargarUsuarios()
    dialogoVisible.value = false
  } catch (error) {
    alert('Error al guardar usuario')
    console.error(error)
  }
}

onMounted(() => {
  cargarUsuarios()
})
</script>
