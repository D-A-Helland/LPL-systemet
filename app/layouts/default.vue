<script setup lang="ts">
import HeaderNav from '~/components/HeaderNav.vue'
</script>

<template>
  <div>
    <HeaderNav />
    <main class="my-5">
      <slot />
    </main>
  </div>
  <div v-if="user">
  Logged in as: {{ user.navn }}
</div>
</template>
<script setup>
const { data: user } = await useFetch('/api/me')
</script>