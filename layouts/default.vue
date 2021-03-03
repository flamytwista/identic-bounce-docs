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

import {arrayToTree} from 'performant-array-to-tree'

export default {
  mounted(){},
  created() {

    // todo:: всю эту хрень касательно составления json для меню вынести в отдельную функцию.
    this.$router.options.routes.forEach(route => {
      this.menuItems.push({
        name: route.name,
        path: route.path
      })
    })

    let routes = this.$router.options.routes



    routes.sort((a, b) => a.path.localeCompare(b.path))
    routes[0].path = '/index' // позже должно быть заменено обратно на '/'

    let menuItemsFlat = routes.map(route=>{
      let slugs = route.path.split('/')
      slugs.shift()
      let currentSlug = slugs[slugs.length - 1]
      let parentSlug = slugs[slugs.length - 2] || null
      return {
        currentSlug,
        parentSlug,
        routeName: route.name,
        menuTitle: route.meta.menuTitle,
        menuWithoutLink: route.meta.menuWithoutLink || false
      }
    })

    let menuItemsTree = arrayToTree(menuItemsFlat, {
      id: "currentSlug", parentId: "parentSlug", dataField: null
    })
    // console.log(menuItemsTree); console.log('^...menuItemsTree:')
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
