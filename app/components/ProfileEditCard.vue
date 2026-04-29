<script setup lang="ts">
import { ref } from 'vue'

const options = ['spiller', 'manager', 'admin']

const props = defineProps<{
  user: {
    name: string
    email: string
    phone?: string
    avatar?: string
    role: string
  }
  button?: string
}>()

const selected = ref(props.user.role)
</script>

<template>
  <UCard class="max-w-sm mx-auto transition">
    <div class="flex flex-col items-center text-center gap-4">
      <UAvatar
        :src="user.avatar"
        size="xl"
      />

      <div>
        <p>Navn</p>
        <input class="edit-form text-xl font-semibold my-2" v-model="user.name"></input>
        <p>Epost</p>
        <input class="edit-form text-sm text-slate-700 dark:text-slate-300 my-2" v-model="user.email"></input>
        <p>Telefonnummer</p>
        <input class="edit-form text-sm text-slate-700 dark:text-slate-300 my-2" v-model="user.phone"></input>
        <p>Passord</p>
        <input class="edit-form text-sm text-slate-700 dark:text-slate-300 my-2"></input>
      </div>
      <div class="text-center">
        <UButton
          v-for="opt in options"
          :key="opt"
          :variant="selected === opt ? 'solid' : 'outline'"
          @click="selected = opt"
        >
          {{ opt.toUpperCase() }}
        </UButton>
      </div>
      <UButton v-if="button" class="max-w-xl">{{ button }}</UButton>
    </div>
  </UCard>
</template>
