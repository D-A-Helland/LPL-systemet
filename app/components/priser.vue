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
          :key="spiller.epost"
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

const { data: spillere, error } = await useFetch('/api/players')

const grouped = computed(() => {
  return (spillere.value || []).reduce((acc, spiller) => {
    const lag = spiller.lagnavn || 'No lag'

    if (!acc[lag]) acc[lag] = []

    acc[lag].push(spiller)

    return acc
  }, {})
})
</script>
<style>
.lag-container {
  display: grid;
  grid-template-columns: 3;
}
.lag-card {
  border-color: white;
  border-width: 1px;
  border-radius: 5px;
  margin: 25px;
}
.lag-card ul {
  display: flex;
  flex-direction: row;
}
.lag-card ul li {
  margin: 15px;
}
</style>
