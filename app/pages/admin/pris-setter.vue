<script setup>
import Tilbake from '~/components/Tilbake.vue'

const { data: players } = await useFetch('/api/players')

const selectedPlayer = ref(null)
const price = ref(null)
const message = ref('')

const submit = async () => {
  try {
    await $fetch('/api/admin/pris-setter', {
      method: 'POST',
      body: {
        spiller_id: selectedPlayer.value,
        pris: Number(price.value),
      },
    })

    message.value = 'Pris oppdatert!'
  } catch (e) {
    console.error(e)
    message.value = 'Error updating price'
  }
}
</script>

<template>
  <UContainer class="">
    <h1 class="text-2xl font-bold">Pris setter</h1>
    <Tilbake :to="`/admin`" />
    <div class="flex justify-center items-center min-h-[70vh]">
      <UCard class="w-full max-w-sm">
        <div class="space-y-6">
          <h1 class="text-2xl font-bold">Sett pris på en spiller</h1>

          <UFormField label="Pris">
            <UInput
              type="number"
              v-model="price"
              placeholder="Skriv inn en pris!"
              icon="i-lucide-banknote"
              class="w-64"
            />
          </UFormField>
          <UFormField label="Spiller">
            <select
              v-model="selectedPlayer"
              placeholder="spiller"
              class="w-64 px-4 py-2.5 rounded-lg border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-900 text-slate-800 dark:text-slate-100 focus:outline-none focus:ring-2 focus:ring-primary-500 transition"
            >
              <option
                disabled
                value=""
              >
                Select player
              </option>
              <option
                v-for="p in players"
                :key="p.id"
                :value="p.id"
              >
                {{ p.navn }} - {{ p.lag?.navn }}
              </option>
            </select>
          </UFormField>
          <UButton
            block
            @click="submit"
          >
            Sett pris
          </UButton>
          <p>{{ message }}</p>
        </div>
      </UCard>
    </div>
  </UContainer>
</template>
