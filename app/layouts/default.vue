<script setup lang="ts">
import HeaderNav from '~/components/HeaderNav.vue'
</script>

<template>
  <div>
    <HeaderNav />
    <main class="my-5">
      <slot />
    </main>
  </div>
</template>
<script setup>
</script>
