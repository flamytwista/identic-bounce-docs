<template>
  <div class="n-container">
    <p>
      <span v-for="n in 30" :key="n">
        1hello
      </span>

    </p>
    <p v-for="n in 12" :key="n">
      : {{ n }}
    </p>

  </div>
</template>

<script>
export default {}
</script>

<style lang="scss">
div {
}
</style>
