<script setup lang="ts">
const { data: user } = await useFetch('/api/me')

const items = [
  {
    title: 'Kamper',
    description: 'Se oversikt over kamper',
    icon: 'i-heroicons-flag',
    to: '/matches',
  },
  {
    title: 'Lag',
    description: 'Se en oversikt over alle lagene',
    icon: 'i-heroicons-user-group',
    to: '/teams',
  },
  {
    title: 'Statistikk',
    description: 'Se rapporter og statistikk',
    icon: 'i-heroicons-chart-bar',
    to: '/statistics',
  },
  {
    title: 'Admin',
    description: 'Kun synlig for admin brukere',
    icon: 'i-heroicons-users',
    to: '/admin',
  },
]
</script>

<template>
  <UContainer class="flex flex-col justify-center items-center min-h-[70vh]">
    <h1 class="mb-5 text-2xl font-bold">Velkommen til dashbordet ditt, {{ user?.navn }}!</h1>
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
