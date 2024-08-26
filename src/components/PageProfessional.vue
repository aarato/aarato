<script setup >
import { onMounted, computed } from "vue";
import { useStore } from '../stores/config.js'
import AccordionItems from '../components/AccordionItems.vue'

const props = defineProps({
    id: String,
    title: String,
    color:  {
      type: String,
      default: "D3D3D4",
    },
    items: Array
});

const store = useStore()
const config = computed(() => store.config.professional);
const language = computed(() => store.language);

onMounted(() => {
    console.log(`Mounted: PageProfessional`)

});
</script>

<template>
   <div id="Professional" 
    class="container-fluid d-flex flex-column justify-content-between align-items-center  min-vh-100 mw-100 p-0 m-0" 
    :style='"background-color: #" + color +";"'
  >

  <div v-if="config" class="container-md pt-4 "  >
      <div class="row p-4" >
      </div>

      <div class="row">
          <h2>{{config.title[language]}}</h2>
      </div>     
      <div class="row">
          <hr class="mt-1 mb-1">
          <h5>{{config.summary.title[language]}}</h5>
      </div>
      <div class="row ps-3">
          <ul class="ps-3">
            <li v-for=" ( item ) in config.summary.list" :key='item'> {{item[language]}} </li>
          </ul>          
      </div>


      <div class="row" >
          <h5>{{config.certs.title[language]}}</h5>
      </div>

      <div class="row justify-content-center " >
        <div v-for="logo in config.certs.logos" :key='logo'  style="width: 190px;"  class="col-sm-2 p-2 my-auto">
          <a :href="logo.url"  target="_blank">
            <img class="img-fluid" :src="logo.picture" alt="">
          </a>
        </div>

      </div>



      <div class="row  pt-3 ">
          <h5>{{config.skills.title[language]}}</h5>
          <!-- <div class="list-group ps-2 mt-1 mb-1" > -->
          <div class="accordion mb-3" id="accordionExample"  >
            <AccordionItems v-for=" ( accordion, index) in config.skills.list" :key="accordion" :id="'skills'+index" :title="accordion.name[language]"  :items="accordion.items" :color="config.color"> </AccordionItems>
          </div>
      </div>


      <div class="row mt-2">
          <h5>{{config.jobs.title[language]}}</h5>
      </div>
      <div v-for=" job in config.jobs.list" :key="job.company" class="row ps-0 mb-2 ms-0">
        <div class="col-lg-4 ps-0">
          <li><b>{{job.company[language]}}</b></li>
        </div>
        <div class="col-lg-8 ps-4">
          {{job.position[language]}} 
          <br> 
          ({{job.dates[language]}})
        </div>
      </div>

      <div class="row mt-2">
          <h5>{{config.education.title[language]}}</h5>
      </div>
      <div v-for=" item in config.education.list" :key="item.school" class="row ps-3 mb-2">
        <div class="col-lg-4 ps-0">
          <li><b>{{item.school[language]}}</b></li>
        </div>
        <div class="col-lg-8 ps-4">
          {{item.degree[language]}}  
          </div>
      </div>     

  </div>

  <!-- Bottom Navigation -->
  <div class="row m-0">
    <a href="#Personal" class="scroll-down align-items">
      <i class="bi bi-arrow-up-square-fill text-light" style="font-size: 4rem;"></i>
    </a>            
  </div>     

  </div> 
</template>