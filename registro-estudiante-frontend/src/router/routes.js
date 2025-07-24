const routes = [
  {
    path: '/login',
    component: () => import('pages/Login.vue')
  },
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '', redirect: '/estudiantes' },
      { path: 'estudiantes', component: () => import('pages/Estudiantes.vue') },
      { path: 'usuarios', component: () => import('pages/Usuarios.vue') },
      { path: 'notas', component: () => import('pages/Notas.vue') },
    ],
    beforeEnter: (to, from, next) => {
      const auth = localStorage.getItem('auth')
      if (!auth) next('/login')
      else next()
    }
  },
  {
    path: '/:catchAll(.*)*',
    component: () => import('pages/ErrorNotFound.vue')
  }
]

export default routes
