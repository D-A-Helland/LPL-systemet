<template>
  <UContainer>
    <Tilbake :to="'/admin/users'" />
    <div v-if="error">User not found</div>
    <div v-else-if="user">
      <ProfileCard
        :user="{
          name: user.navn,
          email: user.epost,
          phone: user.tlf,
          avatar: pravatar,
          role: user.rolle,
        }"
      />
    </div>
    <div v-else>Loading...</div>
  </UContainer>
</template>

<script setup lang="ts">
import ProfileCard from '~/components/ProfileCard.vue'
import Tilbake from '~/components/Tilbake.vue'

const route = useRoute()

const id = computed(() => route.params.id as string)

const { data: user, error } = await useAsyncData(`user-${id.value}`, () =>
  $fetch(`/api/users/${id.value}`),
)

const pravatar = computed(() => `https://i.pravatar.cc/150?img=${id.value}`)
</script>
