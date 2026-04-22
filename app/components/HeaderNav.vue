<script setup lang="ts">
import { computed } from 'vue'
import { type NavigationMenuItem } from '@nuxt/ui'

const { data: user } = await useFetch('/api/me')

const links = computed<NavigationMenuItem[][]>(() => [
  [
    { label: 'Hjem', to: '/' },
    { label: 'Om oss', to: '/about' },

    !user.value && { label: 'Login', to: '/login' },
    !user.value && { label: 'Ny bruker', to: '/ny-bruker' },

    user.value && { label: 'Dashbord', to: '/dashboard' },
    user.value && { label: 'Profil', to: `/profile/${user.value.id}` },
    user.value && { label: 'Logg ut', to: '/logout' },
  ].filter(Boolean) as NavigationMenuItem[],
])
</script>

<template>
  <UHeader class="h-24">
    <template #title>
      <a href="/">
        <img
          src="/images/LPL-logo-hvit.png"
          alt="LPL-Systemet"
          :ui="{
            alt: 'text-2xl font-bold',
          }"
          class="h-20 hidden dark:block"
        />
        <img
          src="/images/LPL-logo-svart.png"
          alt="LPL-Systemet"
          :ui="{
            alt: 'text-2xl font-bold',
          }"
          class="h-20 dark:hidden"
        />
      </a>
    </template>

    <template #default>
      <UNavigationMenu
        color="neutral"
        variant="pill"
        :items="links"
        :ui="{
          link: 'text-slate-700 hover:text-slate-900 dark:text-slate-300 dark:hover:text-white transition',
        }"
      />
    </template>
    <template #body>
      <UNavigationMenu
        color="neutral"
        variant="pill"
        :items="links"
        :ui="{
          link: 'text-slate-700 hover:text-slate-900 dark:text-slate-300 dark:hover:text-white transition',
        }"
      />
    </template>
    <template #right>
      <UColorModeButton />
    </template>
  </UHeader>
</template>
