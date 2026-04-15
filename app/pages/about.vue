<script setup lang="ts">
import ProfileCard from '~/components/ProfileCard.vue'

const users = [
  {
    name: 'David Aleksander Helland',
    email: 'david@email.com',
    avatar: 'https://i.pravatar.cc/150?img=6',
    role: 'Frontend utvikler',
  },
  {
    name: 'Daniel Asdahl',
    email: 'daniel@email.com',
    avatar: 'https://i.pravatar.cc/150?img=7',
    role: 'Backend utvikler',
  },
  {
    name: 'Andreas Tysland Bore',
    email: 'andreas@email.com',
    avatar: 'https://i.pravatar.cc/150?img=8',
    role: 'Drift sjef',
  },
]
</script>

<template>
  <UContainer>
    <h1 class="text-2xl font-bold text-center">Teamet som står bak LPL systemet.</h1>
    <div class="flex *:w-xl mt-5">
      <ProfileCard
        v-for="user in users"
        :user="user"
      />
    </div>
  </UContainer>
</template>
