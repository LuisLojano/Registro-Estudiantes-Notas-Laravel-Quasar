import { route } from 'quasar/wrappers'
import { createRouter, createWebHistory } from 'vue-router'
import routes from './routes'

export default route(function () {
  const Router = createRouter({
    history: createWebHistory(),
    routes,
    scrollBehavior: () => ({ left: 0, top: 0 })
  })

  Router.beforeEach((to, from, next) => {
    const isLoggedIn = localStorage.getItem('auth')

    if (to.path !== '/login' && !isLoggedIn) {
      next('/login')
    } else if (to.path === '/login' && isLoggedIn) {
      next('/usuarios')
    } else {
      next()
    }
  })

  return Router
})
