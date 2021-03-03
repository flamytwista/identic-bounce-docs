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
    console.log(this.$router.options.routes); console.log('^...this.$router.options.routes:')
    console.log(this.$router); console.log('^...this.$router:')
    console.log(this.$router.matcher.getRoutes()); console.log('^...this.$router.matcher.getRoutes():')
  },
  created() {
    this.$router.options.routes.forEach(route => {
      this.menuItems.push({
        name: route.name,
        path: route.path
      })
    })
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
