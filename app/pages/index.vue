<script setup lang="ts">
const { data: user } = await useFetch('/api/me')
</script>

<template>
  <UContainer class="flex flex-col justify-center items-center min-h-[70vh]">
    <h1
      v-if="user"
      class="text-2xl font-bold mb-5 text-center"
    >
      Velkommen til LPL-Systemet, {{ user?.navn }}!
    </h1>
    <h1
      v-else
      class="text-2xl font-bold mb-5 text-center"
    >
      Velkommen til LPL-Systemet!
    </h1>
    <Priser />
    <h1 class="text-2xl font-bold">{{ user?.navn }}</h1>
  </UContainer>
</template>
