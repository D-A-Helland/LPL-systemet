<script setup>
const { data: players } = await useFetch('/api/players')

const selectedPlayer = ref(null)
const price = ref(null)
const message = ref('')

const submit = async () => {
  try {
    await $fetch('~/../server/api/admin/set-price', {
      method: 'POST',
      body: {
        spiller_id: selectedPlayer.value,
        pris: Number(price.value)
      }
    })

    message.value = 'Price updated!'
  } catch (e) {
    console.error(e)
    message.value = 'Error updating price'
  }
}
</script>

<template>
  <div>
    <h1>Set Player Price</h1>

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
      placeholder="Enter price"
    />

    <button @click="submit">Set Price</button>

    <p>{{ message }}</p>
  </div>
</template>