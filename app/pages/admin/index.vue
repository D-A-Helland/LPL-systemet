<script setup lang="ts">
const items = [
  {
    title: 'Sett priser',
    description: 'Se oversikt over kamper',
    icon: 'i-heroicons-flag',
    to: '/admin/pris-setter',
  },
  {
    title: 'Brukere',
    description: 'Se hvem som bruker LPL-Systemet',
    icon: 'i-heroicons-users',
    to: '/admin/users',
  },
  {
    title: 'Etellerannet',
    description: 'Denne er her for å få symmetri',
    icon: 'i-heroicons-link',
    to: '/admin',
  },
]
</script>

<template>
  <UContainer class="flex flex-col justify-center items-center min-h-[70vh]">
    <h1 class="text-2xl font-bold mb-5">Admin side</h1>
    <UPageGrid>
      <UPageCard
        v-for="item in items"
        :key="item.title"
        :title="item.title"
        :description="item.description"
        :icon="item.icon"
        :to="item.to"
        class="hover:scale-[1.02] transition"
      />
    </UPageGrid>
  </UContainer>
</template>
