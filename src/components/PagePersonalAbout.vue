<script setup >
import { onMounted, computed } from "vue";
import { useStore } from '../stores/config.js'

const store = useStore()
const config = computed(() => store.config.personal);
const language = computed(() => store.language);
const id = "about"
onMounted(() => {
    console.log(`Mounted: PagePersonalAbout`)

});
</script>

<template>
    <div class="row m-0 justify-content-center" id="id" >

    <!-- Left Column -->
    <div class="col-md-4 ps-0 pt-2 ">
    <h4>{{config.about.title[language]}}</h4>
    <p v-for=" ( paragraph ) in config.about.paragraphs" :key='paragraph'>
        {{paragraph[language]}}
    </p>
    </div>

    <!-- Middle Column -->
    <div class="col-md-4 ps-0">
    <div class="d-flex flex-column align-items-center justify-content-center m-0 ">
        <img :src="config.about.images.face" class="img-fluid border-0 img-responsive img-thumbnail" alt="..." style="background-color: #b3afac;"> 
    </div>
    </div>

    <!-- Right Column -->
    <div class="col-md-4 ps-0 pt-2 text-center">
    <h4>{{config.about.details.title[language]}}</h4>
    <p class="m-0" v-for=" ( detail ) in config.about.details.info" :key='detail.title' >
        <strong>{{detail.title[language]}}</strong>
        <br>
        {{detail.text[language]}}
        <br>
    </p>
    <p v-if="config.about.contacts">
        <strong>{{config.about.contacts.title[language]}}</strong>
        <br>
        <a v-if="config.about.contacts.linkedin" :href="config.about.contacts.linkedin" target="_blank" class="me-2" data-show-count="false">
        <i class="bi bi-linkedin" style="font-size: 2rem;"></i>
        </a>
        <a v-if="config.about.contacts.github" :href="config.about.contacts.github" target="_blank" class=" me-2" data-show-count="false">
        <i class="bi bi-github" style="font-size: 2rem;"></i>
        </a>
        <a v-if="config.about.contacts.facebook" :href="config.about.contacts.facebook" target="_blank" class="me-2" data-show-count="false">
        <i class="bi bi-facebook" style="font-size: 2rem;"></i>
        </a>
        <a v-if="config.about.contacts.twitter" :href="config.about.contacts.twitter" target="_blank" class=" me-2" data-show-count="false">
        <i class="bi bi-twitter" style="font-size: 2rem;"></i>
        </a>
        <a v-if="config.about.contacts.mailto" :href="config.about.contacts.mailto" class="me-2" data-show-count="false">
        <i class="bi bi-envelope" style="font-size: 2rem;"></i>
        </a>
    </p>
    </div>

    </div>    
</template>