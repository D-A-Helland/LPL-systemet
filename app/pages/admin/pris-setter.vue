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
        pris: Number(price.value)
      }
    })

    message.value = 'Pris oppdatert!'
  } catch (e) {
    console.error(e)
    message.value = 'Error updating price'
  }
}
</script>

<template>
  <div>
    <h1>Set Player Price</h1>
    <Tilbake :to="`/admin`" />

    <select v-model="selectedPlayer">
      <option disabled value="">Select player</option>
      <option
        v-for="p in players"
        :key="p.id"
        :value="p.id"
      >
        {{ p.navn }} - {{ p.lag?.navn }}
      </option>
    </select>

    <input
      type="number"
      v-model="price"
      placeholder="Skriv inn pris!"
    />

    <button @click="submit">Sett pris!</button>

    <p>{{ message }}</p>
  </div>
</template>
