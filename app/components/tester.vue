<template>
    <h1>Admin side</h1>

    <div class="lag-container" v-for="(spillere, lag) in grouped" :key="lag">
        <div class="lag-card">
            <h2>{{ lag }}</h2>
            <ul v-for="spiller in spillere" :key="spiller.epost">
                <li>{{ spiller.navn }}</li>
                <li>{{ spiller.pris }}</li>
            </ul>
        </div>
    </div>
</template>
<script setup>
const { data: spillere, error } = await useFetch('/api/players');

const grouped = spillere.value.reduce((acc, spiller) => {
  const lag = spiller.lagnavn || 'No lag'

  if (!acc[lag]) acc[lag] = []

  acc[lag].push(spiller)

  return acc
}, {})
</script>
<style>
.lag-container {
    display: grid;
    grid-template-columns: 3;
}
.lag-card {
    border-color: white;
    border-width: 1px;
    border-radius: 5px;
}
.lag-card ul{
    display: flex;
    flex-direction: row;
}
.lag-card ul li {
    margin: 15px
}
</style>