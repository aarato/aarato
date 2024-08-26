<script setup >
import { onMounted, computed } from "vue";
import { useStore } from '../stores/config.js'
import PagePersonalAbout from '../components/PagePersonalAbout.vue'
import PagePersonalInterest from '../components/PagePersonalInterest.vue'
import PagePersonalTravelPics from '../components/PagePersonalTravelPics.vue'
import PagePersonalTravelLogs from '../components/PagePersonalTravelLogs.vue'

const props = defineProps({
    id: String,
    title: String,
    color:  {
      type: String,
      default: "b3afac",
    },
    items: Array
});


const store = useStore()
const config = computed(() => store.config.personal);
const language = computed(() => store.language);

onMounted(() => {
    console.log(`Mounted: PagePersonal`)

});
</script>

<template>
   <div  
    id="Personal" 
    class="container-fluid d-flex flex-column justify-content-between align-items-center  min-vh-100 mw-100 p-0 m-0" 
    :style='"background-color: #" + color +";"'
  >

    <div v-if="config" class="container-md pt-4 "  >

      <!-- Title with Extra spacing -->
      <div class="row m-0 p-4"></div>   
      <div class="row">
        <h2>{{config.title[language]}}</h2>
      </div>    
      <hr class="m-0">

      <!-- Rows -->
      <PagePersonalAbout/>
      <PagePersonalInterest/>
      <PagePersonalTravelPics/>
      <PagePersonalTravelLogs/>

    </div>
    
    <!-- Scroll-Down -->
    <div class="row m-0">
      <a href="#Professional" class="scroll-down align-items">
        <i class="bi bi-arrow-down-square-fill text-light" style="font-size: 4rem;"></i>
      </a>            
    </div>        

  </div>
</template>