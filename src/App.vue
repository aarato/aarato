<script setup>
import { onMounted } from 'vue'
import NavBar from './components/NavBar.vue'
import PageFront from './components/PageFront.vue'
import PagePersonal from './components/PagePersonal.vue'
import PageProfessional from './components/PageProfessional.vue'
import ModalLanguage from './components/ModalLanguage.vue'
import { useStore } from './stores/config.js'

const store = useStore()

onMounted( async () => {
  
  // await store.fetchYaml('https://aarato.s3.amazonaws.com/config.yaml')
  await store.fetchYaml('https://raw.githubusercontent.com/aarato/aarato/main/config.yaml')
  console.log(`Mounted: App`)
  console.log(store.config)
})
</script>

<template>
  <div class="container-fluid p-0" >
    <PageFront  v-if="store.ready" />
    <NavBar  v-if="store.ready" />
    <PagePersonal  v-if="store.ready" />
    <PageProfessional  v-if="store.ready" />
    <ModalLanguage  v-if="store.ready" />
  </div>
</template>

<style >
@font-face {
   font-family: CartaMagna;
   src: url('/fonts/CartaMagna/CartaMagna.ttf') format('truetype')
}
@font-face {
   font-family: DayRoman;
   src: url('/fonts/DayRoman/DAYROM__.ttf') format('truetype')
}
.CartaMagna{
  font-family: CartaMagna;
}
.DayRoman{
  font-family: DayRoman;
}
</style>
