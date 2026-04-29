<script setup lang="ts">
const isAdmin = true

type User = {
  id: number
  navn: string
  epost: string
  rolle: string
}

const { data: users, pending, error, refresh } = await useFetch<User[]>('/api/users')

import type { TableColumn } from '@nuxt/ui'
import Tilbake from '~/components/Tilbake.vue'

const columns: TableColumn<any>[] = [
  {
    accessorKey: 'navn',
    header: 'Navn',
  },
  {
    accessorKey: 'epost',
    header: 'E-post',
  },
  {
    accessorKey: 'rolle',
    header: 'Rolle',
  },
  {
    id: 'actions',
    header: 'Handlinger',
  },
]

const deleteUser = async (id: number) => {
  if (!confirm('Er du sikker på at du vil slette brukeren?')) return

  await $fetch(`/api/users/${id}`, {
    method: 'DELETE' as any,
  })

  await refresh()
}
</script>

<template>
  <UContainer>
    <h1 class="text-2xl font-bold mb-4">Brukere</h1>

    <Tilbake :to="`/admin`" />

    <!-- Loading -->
    <div v-if="pending">Laster...</div>

    <!-- Error -->
    <div v-else-if="error">Noe gikk galt</div>

    <!-- Table -->
    <UTable
      v-else
      :data="users || []"
      :columns="columns"
    >
      <!-- Admin badge -->
      <template #rolle-data="{ row }">
        <UBadge
          v-if="row.original.rolle === 'admin'"
          color="primary"
        >
          Ja
        </UBadge>
        <span v-else>Nei</span>
      </template>

      <!-- Actions -->
      <template #actions-cell="{ row }">
        <div class="flex gap-2">
          <!-- Edit -->
          <UButton
            size="xs"
            icon="i-heroicons-pencil-square"
            :to="`/admin/user/${row.original.id}`"
            variant="soft"
          />

          <!-- Delete -->
          <UButton
            size="xs"
            icon="i-heroicons-trash"
            variant="soft"
            @click="deleteUser(row.original.id)"
          />
        </div>
      </template>
    </UTable>
  </UContainer>
</template>
