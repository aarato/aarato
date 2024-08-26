<script setup >
import { onMounted, computed } from "vue";
import { useStore } from '../stores/config.js'

const store = useStore()
const config = computed(() => store.config.personal);
const language = computed(() => store.language);

onMounted(() => {
    console.log(`Mounted: PagePersonalInterest`)

});
</script>

<template>
    <div class="row mt-2 m-0 justify-content-center" id="id">
        <h4 class="p-0">{{config.interests.title[language]}}</h4>
        <ul class="m-0">
            <li v-for=" ( interest ) in config.interests.list" :key='interest.text'> {{interest.text[language]}} 
                <a v-if="interest.url" :href="interest.url" target="_blank" class="me-2" data-show-count="false">
                <i v-if="interest.url" class="bi bi-link-45deg text-primary" style="font-size: 1rem;"></i>
                </a>
            </li>               
        </ul>   
    </div>    
</template>