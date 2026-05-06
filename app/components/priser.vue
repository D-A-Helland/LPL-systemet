<template>
  <UContainer
    v-for="(spillere, lag) in grouped"
    :key="lag"
  >
    <UCard class="mb-5">
      <h2 class="text-xl font-semibold">{{ lag }}</h2>

      <div class="space-y-2">
        <div
          v-for="spiller in spillere"
          :key="spiller.id" 
        >
          <NuxtLink
            :to="`/profile/${spiller.id}`"
            class="grid grid-cols-[1fr_auto] justify-start items-center gap-4 max-w-sm p-3 rounded-lg hover:bg-slate-100 dark:hover:bg-slate-800 transition"
          >
            <span class="font-medium">{{ spiller.navn }}</span>
            <span class="text-slate-500">{{ spiller.pris }} kr</span>
          </NuxtLink>
        </div>
      </div>
    </UCard>
  </UContainer>
</template>

<script setup>
import { computed } from 'vue'

// We provide a unique key ('player-list') to ensure Nuxt tracks 
// this specific data fetch across route navigations.
const { data: spillereRaw } = await useFetch('/api/players', {
  key: 'player-list'
})

const grouped = computed(() => {
  // Ensure we have an array to work with, even if data is loading or null
  const allPlayers = Array.isArray(spillereRaw.value) ? spillereRaw.value : []

  return allPlayers.reduce((acc, spiller) => {
    // If for some reason a record is missing an ID, we skip it 
    // to prevent broken links
    if (!spiller.id) return acc

    const lag = spiller.lagnavn || 'No lag'

    if (!acc[lag]) {
      acc[lag] = []
    }

    acc[lag].push(spiller)

    return acc
  }, {})
})
</script>
