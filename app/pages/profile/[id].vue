<script setup lang="ts">
const route = useRoute()

const id = computed(() => route.params.id as string)

const { data: user, error } = await useAsyncData(`user-${id.value}`, () =>
  $fetch(`/api/users/${id.value}`),
)
</script>

<template>
  <UContainer class="flex justify-center">
    <div v-if="error">User not found</div>

    <UCard
      v-else-if="user"
      class="text-center w-3xl"
    >
      <h1 class="text-2xl font-bold">User navn</h1>
    </UCard>

    <div v-else>Loading...</div>
  </UContainer>
</template>
