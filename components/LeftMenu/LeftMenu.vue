<template>
  <div class="leftMenu">
    <left-menu-item
      v-for="menuItem in menuItems"
      :key="menuItem.routeName"
      :menu-item="menuItem"
    >
    </left-menu-item>
  </div>
</template>

<script>
/**
 * Решение временное и корявое - лишь бы побыстрее получить это меню.
 * todo:: Нужно вынести это меню во фреймворк.
 */
export default {
  props: {
    menuItems: {
      type: Array,
      required: true
    }
  }
}
</script>

<style scoped lang="scss">
// Обычно позиционирование компонента делается снаружи.
// Но т.к. это меню должно быть всегда в одном и том-же месте, то оно спозиционировано изнутри.
.leftMenu {
  position: fixed;
  left: 0;
  top: 0;
  bottom: 0;
  width: 200px;
  outline: 1px solid darkred;

  .left-menu-item {
    margin-left: 16px;
  }
}
</style>
