<script setup>
import { ref } from 'vue'

const form = ref({
  navn: '',
  klasse: '',
})

const message = ref('')
const error = ref('')

const submit = async () => {
  message.value = ''
  error.value = ''

  try {
    await $fetch('/api/admin/lag', {
      method: 'POST',
      body: form.value,
    })

    message.value = 'Lag opprettet!'

    form.value = {
      navn: '',
      klasse: '',
    }
  } catch (e) {
    console.error(e)
    error.value = e?.data?.statusMessage || 'Noe gikk galt'
  }
}
</script>

<template>
  <UContainer class="flex justify-center items-center min-h-[70vh]">
    <UCard class="w-full max-w-sm">
      <div class="space-y-6">
        <h1 class="text-2xl font-bold flex items-center gap-2">
          <UIcon name="i-heroicons-user-group" />
          Nytt lag
        </h1>

        <UForm
          :state="form"
          @submit="submit"
          class="space-y-4"
        >
          <UFormField label="Lagnavn">
            <UInput
              v-model="form.navn"
              placeholder="Lagnavn"
              icon="i-lucide-users"
            />
          </UFormField>

          <UFormField label="Klasse">
            <UInput
              v-model="form.klasse"
              placeholder="Klasse"
              icon="i-lucide-layers"
            />
          </UFormField>

          <UButton
            block
            type="submit"
          >
            Opprett lag
          </UButton>
        </UForm>

        <p
          v-if="message"
          class="text-green-500 text-sm"
        >
          {{ message }}
        </p>

        <p
          v-if="error"
          class="text-red-500 text-sm"
        >
          {{ error }}
        </p>
      </div>
    </UCard>
  </UContainer>
</template>
