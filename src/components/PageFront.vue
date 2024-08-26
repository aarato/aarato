<script setup >
import { onMounted, computed } from "vue";
import { useStore } from '../stores/config.js'
import PageFrontTitle from '../components/PageFrontTitle.vue'
import PageFrontCarousel from '../components/PageFrontCarousel.vue'
const store = useStore()
const config = computed(() => store.config.frontpage);
const language = computed(() => store.language);
function resetHeight(){
      // reset the body height to that of the inner browser
      const element = document.getElementById("Home")
      if (element){
        element.style.height = window.innerHeight + "px";
      }     
  }

onMounted(() => {
  // reset the height whenever the window's resized
  window.addEventListener("resize", resetHeight);
    resetHeight();
    console.log(`Mounted: PageFront`)

});
</script>

<template>
  <div  id="Home" class="row p-0 m-0 ">
    <div 
      class="container d-flex flex-column justify-content-between align-items-center p-0 m-0" 
      :style="'background-image: url(' + config.images.main + ');   background-position: center;  background-size: cover;  background-repeat: no-repeat;'"
    >

      <PageFrontTitle/>
      
      <div class="container-fluid m-0 px-0 text-light">
        <PageFrontCarousel/>


        <div class="d-flex align-items-center justify-content-center ">
          <a href="#Personal" class="scroll-down align-items ">
            <i class="bi bi-arrow-down-square-fill text-light" style="font-size: 4rem;"></i>
          </a>                  
        </div>
    
      </div>     
      
    </div>
  </div>
</template>