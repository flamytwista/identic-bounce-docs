<template>
  <div>
    <br>
    <div class="container">
      <NuxtLink to="/">Главная</NuxtLink>
      &nbsp;&nbsp;
      <NuxtLink to="/headers-testing">Заголовки(тестирование)</NuxtLink>
    </div>
    <br>
    <Nuxt />
  </div>
</template>

<script>
export default {
  mounted(){
    // console.log(this.$router.options.routes); console.log('^...this.$router.options.routes:')
  },
  created() {
    // вход
    // 0: {path: "/typo", meta: {…}, name: "typo", component: ƒ}
    // 1: {path: "/forms/buttons", meta: {…}, name: "forms-buttons", component: ƒ}
    // 2: {path: "/forms/inputs", meta: {…}, name: "forms-inputs", component: ƒ}
    // 3: {path: "/typo/headers-testing", meta: {…}, name: "typo-headers-testing", component: ƒ}
    // 4: {path: "/", meta: {…}, name: "index", component: ƒ}
    this.$router.options.routes.forEach(route => {
      this.menuItems.push({
        name: route.name,
        path: route.path
      })
    })

    let routes = this.$router.options.routes



    routes.sort((a, b) => a.path.localeCompare(b.path))
    routes[0].path = '/index' // позже должно быть заменено обратно на '/'

    let menuItems = routes.map(route=>{
      return {
        
      }
    })

    console.log(routes); console.log('^...routes:')
    // Выход
    let yo = [
      {
        menuTitle: '',
        routeName: 'index',
      },
      {
        menuTitle: '',
        routeName: 'typo',
        children: [
          {
            menuTitle: '',
            routeName: 'typo-headers-testing'
          }
        ]
      },
      {

      }

    ]
  }
  , data() {
    return {
      menuItems: []
    }
  }
}
</script>

<style>

html {
  font-family:
    'Source Sans Pro',
    -apple-system,
    BlinkMacSystemFont,
    'Segoe UI',
    Roboto,
    'Helvetica Neue',
    Arial,
    sans-serif;
  font-size: 16px;
  word-spacing: 1px;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;
}

*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
}

</style>
