<template>
  <div>
    <left-menu
      :menu-items="menuItems"
    ></left-menu>
    <div class="container">
      <h1>{{$route.meta.menuTitle}}</h1>
      <Nuxt />
    </div>
  </div>
</template>

<script>

import {arrayToTree} from 'performant-array-to-tree'

export default {
  mounted(){},
  created() {

    // todo:: всю эту хрень касательно составления json для меню вынести в отдельную функцию.
    // todo:: Сделать коммент что это канает только для нединамических маршрутов.
    this.$router.options.routes.forEach(route => {
      this.menuItems.push({
        name: route.name,
        path: route.path
      })
    })

    let routes = this.$router.options.routes



    routes.sort((a, b) => a.path.localeCompare(b.path))
    routes[0].path = '/index' // позже должно быть заменено обратно на '/'

    // console.log(routes); console.log('^...routes:')

    let menuItemsFlat = routes.map(route=>{
      let slugs = route.path.split('/')
      slugs.shift()
      let currentSlug = slugs[slugs.length - 1]
      let parentSlug = slugs[slugs.length - 2] || null
      return {
        currentSlug,
        parentSlug,
        // routeName: route.name,
        routePath: (route.path === '/index') ? '/' : route.path,
        menuTitle: route.meta.menuTitle,
        menuWithoutLink: route.meta.menuWithoutLink || false
      }
    })

    let menuItemsTree = arrayToTree(menuItemsFlat, {
      id: "currentSlug", parentId: "parentSlug", dataField: null
    })

    this.menuItems = menuItemsTree
    routes[0].path = '/'  // Меняю обратно, без этого не работает nuxt generate
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
