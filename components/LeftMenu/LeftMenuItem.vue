<template>
  <div class="left-menu-item">

    <nuxt-link v-if="!menuItem.menuWithoutLink" :to="{name: menuItem.routeName}">{{menuItem.menuTitle}}</nuxt-link>
    <a v-if="menuItem.menuWithoutLink">{{menuItem.menuTitle}}</a>

    <template
      v-if="menuItem.children"
    >
      <left-menu-item
        v-for="menuItem in menuItem.children"
        :key="menuItem.routeName"
        :menu-item="menuItem"
      >

      </left-menu-item>
    </template>
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
.left-menu-item {
  > .left-menu-item {
    margin-left: 16px;
  }
}
</style>
