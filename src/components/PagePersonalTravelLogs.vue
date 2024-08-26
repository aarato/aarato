<script setup >
import { onMounted, computed } from "vue";
import { useStore } from '../stores/config.js'
import AccordionItems from '../components/AccordionItems.vue'

const store = useStore()
const config = computed(() => store.config.personal);
const language = computed(() => store.language);

onMounted(() => {
    console.log(`Mounted: PagePersonalTravelLogs`)

});
</script>

<template>
  <div v-if="config.countries" class="row mt-3">
    <h4>{{config.countries.title[language]}}</h4>
    <div>
      <p>
        {{config.countries.paragraph[language]}}(<a href="https://travelerscenturyclub.org/countries-and-territories" target="_blank">def.</a>)
      </p>
    </div>
    <br>
    <div class="accordion mb-3" id="accordionExample"  >
      <AccordionItems id="na" :title="config.countries.list.na.name[language]+' ('+ config.countries.list.na.items.length +')'" :items="config.countries.list.na.items" :color="config.color"/>
      <AccordionItems id="eu" :title="config.countries.list.eu.name[language]+' ('+ config.countries.list.eu.items.length +')'" :items="config.countries.list.eu.items" :color="config.color"/>
      <AccordionItems id="cr" :title="config.countries.list.cr.name[language]+' ('+ config.countries.list.cr.items.length +')'" :items="config.countries.list.cr.items" :color="config.color"/>
      <AccordionItems id="as" :title="config.countries.list.as.name[language]+' ('+ config.countries.list.as.items.length +')'" :items="config.countries.list.as.items" :color="config.color"/>
      <AccordionItems id="me" :title="config.countries.list.me.name[language]+' ('+ config.countries.list.me.items.length +')'" :items="config.countries.list.me.items" :color="config.color"/>
      <AccordionItems id="af" :title="config.countries.list.af.name[language]+' ('+ config.countries.list.af.items.length +')'" :items="config.countries.list.af.items" :color="config.color"/>
      <AccordionItems id="op" :title="config.countries.list.op.name[language]+' ('+ config.countries.list.op.items.length +')'" :items="config.countries.list.op.items" :color="config.color"/>
    </div>        
  </div>    
</template>