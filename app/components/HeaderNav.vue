<script setup lang="ts">
import { ref } from 'vue'
import { type NavigationMenuItem } from '@nuxt/ui'

const links = ref<NavigationMenuItem[][]>([
  [
    { label: 'Hjem', to: '/' },
    { label: 'Om oss', to: '/about' },
    { label: 'Login', to: '/login' },
  ],
])
</script>

<template>
  <UHeader class="h-24">
    <template #title>
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
