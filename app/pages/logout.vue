<script setup lang="ts">
await $fetch('/api/logout', {
  method: 'POST',
  credentials: 'include'
})

await navigateTo('/')
await refreshNuxtData('me')
</script>

<template>
  <UContainer>
    <h1 class="text-2xl font-bold">Logger ut...</h1>
  </UContainer>
</template>
