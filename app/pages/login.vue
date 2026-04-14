<template>
  <div>
    <h1>Login</h1>

    <form @submit.prevent="login">
      <input v-model="form.epost" placeholder="Email" />
      <input v-model="form.password" type="password" placeholder="Password" />

      <button type="submit">Login</button>
    </form>

    <p v-if="error">{{ error }}</p>
  </div>
</template>
<script setup>
const form = ref({
  epost: '',
  password: ''
})

const error = ref('')

const login = async () => {
  try {
    await $fetch('/api/login', {
      method: 'POST',
      body: form.value
    })

    // redirect after login
    await navigateTo('/')
  } catch (err) {
    error.value = 'Wrong email or password'
  }
}
</script>