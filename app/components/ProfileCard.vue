<script setup lang="ts">
defineProps<{
  user: {
    name: string
    email: string
    avatar?: string
    role?: string
  }
}>()
</script>

<template>
  <UCard class="max-w-sm mx-auto hover:scale-105 transition">
    <div class="flex flex-col items-center text-center gap-4">
      <UAvatar
        :src="user.avatar"
        size="xl"
      />

      <div>
        <h2 class="text-xl font-semibold">{{ user.name }}</h2>
        <p class="text-sm text-slate-500 dark:text-slate-400">{{ user.email }}</p>
      </div>

      <UBadge
        v-if="user.role"
        color="primary"
        variant="soft"
      >
        {{ user.role }}
      </UBadge>
    </div>
  </UCard>
</template>
