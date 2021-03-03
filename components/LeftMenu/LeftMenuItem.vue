<template>
  <div class="left-menu-item">
    <nuxt-link :to="{name: menuItem.routeName}">{{menuItem.menuTitle}}</nuxt-link>
  </div>
</template>

<script>

export default {
  name: 'left-menu-item',
  props: {
    menuItem: {
      type: Object,
      required: true
    }
  }
}
</script>

<style scoped lang="scss">
.left-menu-item {}
</style>
