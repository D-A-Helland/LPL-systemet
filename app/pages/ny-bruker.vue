<template>
    <div class="p-6">
        <h1>Create User</h1>

        <form @submit.prevent="createUser">
            <input v-model="form.navn" placeholder="Name" />
            <input v-model="form.tlf" placeholder="Tlf">
            <input v-model="form.epost" placeholder="Email" />
            <input v-model="form.password" type="password" placeholder="Password" />
            <select v-model="form.lag_id">
                <option v-for="lag in lagList" :key="lag.id" :value="lag.id">
                {{ lag.navn }}
                </option>
            </select>

            <button type="submit">Create</button>
        </form>

        <p v-if="message">{{ message }}</p>
    </div>
</template>
<script setup>
    const { data: lagList } = await useFetch('/api/lag')

const form = ref({
  navn: '',
  tlf: '',
  epost: '',
  password: ''
})

const message = ref('')

const createUser = async () => {
  try {
    const res = await $fetch('/api/users', {
      method: 'POST',
      body: form.value
    })

    message.value = 'User created!'

    // clear form
    form.value = {
      navn: '',
      tlf: '',
      epost: '',
      password: ''
    }

  } catch (err) {
    message.value = err.data?.statusMessage || 'Error'
  }
}
</script>