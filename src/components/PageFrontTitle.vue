<script setup >
import { onMounted, computed } from "vue";
import { useStore } from '../stores/config.js'
const store = useStore()
const config = computed(() => store.config.frontpage);
const language = computed(() => store.language);
onMounted(() => {
    console.log(`Mounted: PageFrontTitle`)
});
</script>

<template>
      <div class="jumbotron text-center text-light pt-4">
        <h1 class="display-5 DayRoman mb-0">{{config.title[language]}}</h1>
        <hr class="my-2">
        <p class="lead">
          {{config.subtitle[language]}} 
        </p>       
      </div>
</template>