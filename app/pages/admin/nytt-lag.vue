<script setup>
const navn = ref('')
const klasse = ref('')
const message = ref('')
const error = ref('')

const submit = async () => {
  message.value = ''
  error.value = ''

  try {
    const res = await $fetch('/api/admin/lag', {
      method: 'POST',
      body: {
        navn: navn.value,
        klasse: klasse.value
      }
    })

    message.value = 'Lag oprettet!'
    navn.value = ''
    klasse.value = ''
  } catch (e) {
    console.error(e)

    error.value = e?.data?.statusMessage || 'Noe gikk galt'
  }
}
</script>

<template>
  <div style="max-width: 400px; margin: auto;">
    <h1>Nytt lag</h1>

    <form @submit.prevent="submit">
      <div>
        <label>Lagnavn</label>
        <input
          v-model="navn"
          type="text"
          placeholder="Lagnavn"
          required
        />
      </div>

      <div style="margin-top: 10px;">
        <label>Klasse</label>
        <input
          v-model="klasse"
          type="text"
          placeholder="Klasse"
          required
        />
      </div>

      <button type="submit" style="margin-top: 15px;">
        Oprett lag
      </button>
    </form>

    <p v-if="message" style="color: green;">{{ message }}</p>
    <p v-if="error" style="color: red;">{{ error }}</p>
  </div>
</template>