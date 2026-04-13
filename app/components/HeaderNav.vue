<script setup lang="ts">
const links = [
  { label: 'Hjem', to: '/' },
  { label: 'Hjem2', to: '/' },
]
</script>

<template>
  <UHeader>
    <template #title>
      <h1 class="text-2xl font-bold">LPL-Systemet</h1>
    </template>

    <nav class="hidden lg:flex gap-4">
      <UButton
        v-for="link in links"
        :key="link.to"
        :to="link.to"
      >
        {{ link.label }}
      </UButton>
    </nav>

    <template #body>
      <UButton
        v-for="link in links"
        :key="link.to"
        :to="link.to"
        class="mr-4"
      >
        {{ link.label }}
      </UButton>
    </template>
    <template #right>
      <UColorModeButton />
    </template>
  </UHeader>
</template>
