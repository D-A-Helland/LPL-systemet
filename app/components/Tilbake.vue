<script setup lang="ts">
defineProps<{
  to: string
}>()
</script>

<template>
  <NuxtLink :to="`/admin`">
    <UButton
      variant="soft"
      class="my-4"
    >
      Tilbake
    </UButton>
  </NuxtLink>
</template>
