<script setup>
const { data: lagList } = await useFetch('/api/lag')

const form = ref({
  navn: '',
  tlf: '',
  epost: '',
  password: '',
  lag_id: null,
})

const message = ref('')

const createUser = async () => {
  try {
    const res = await $fetch('/api/users', {
      method: 'POST',
      body: form.value,
    })

    message.value = 'User created!'

    // clear form
    form.value = {
      navn: '',
      tlf: '',
      epost: '',
      password: '',
      lag_id: null,
    }
  } catch (err) {
    message.value = err.data?.statusMessage || 'Error'
  }
}
</script>

<template>
  <UContainer class="flex justify-center items-center min-h-[70vh]">
    <UCard class="w-full max-w-sm">
      <div class="space-y-6">
        <h1 class="text-2xl font-bold">Lag ny bruker</h1>

        <UForm
          :state="form"
          @submit="createUser"
          class="space-y-4"
        >
          <UFormField label="Navn">
            <UInput
              v-model="form.navn"
              placeholder="Navn"
              icon="i-lucide-user"
              class="w-84"
            />
          </UFormField>

          <UFormField label="Tlf">
            <UInput
              v-model="form.tlf"
              placeholder="Tlf"
              icon="i-lucide-phone"
              class="w-84"
            />
          </UFormField>

          <UFormField label="Epost">
            <UInput
              v-model="form.epost"
              placeholder="Epost"
              icon="i-lucide-mail"
              class="w-84"
            />
          </UFormField>

          <UFormField label="Passord">
            <UInput
              v-model="form.password"
              type="password"
              placeholder="Passord"
              icon="i-lucide-lock"
              class="w-84"
            />
          </UFormField>

          <UButton
            block
            type="submit"
          >
            Opprett bruker
          </UButton>
        </UForm>
      </div>
    </UCard>
  </UContainer>
  <!-- Her er den gamle registreringsformen i tilfelle jeg har gjort noe feil på den nye
  <div class="p-6">
    <h1>Create User</h1>

    <form @submit.prevent="createUser">
      <input
        v-model="form.navn"
        placeholder="Name"
      />
      <input
        v-model="form.tlf"
        placeholder="Tlf"
      />
      <input
        v-model="form.epost"
        placeholder="Email"
      />
      <input
        v-model="form.password"
        type="password"
        placeholder="Password"
      />
      <select v-model="form.lag_id">
        <option
          v-for="lag in lagList"
          :key="lag.id"
          :value="lag.id"
        >
          {{ lag.navn }}
        </option>
      </select>

      <button type="submit">Create</button>
    </form>

    <p v-if="message">{{ message }}</p>
  </div>
  -->
</template>
