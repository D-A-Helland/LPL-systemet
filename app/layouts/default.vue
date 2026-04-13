<script setup lang="ts">
import HeaderNav from '~/components/HeaderNav.vue'
</script>

<template>
  <div>
    <HeaderNav />
    <main>
      <slot />
    </main>
  </div>
</template>
