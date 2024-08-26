<script setup >
import { onMounted, computed } from "vue";
import { useStore } from '../stores/config.js'

const props = defineProps({
    id: String,
    title: String,
    color: String,
    items: Array
});

const store = useStore()
const config = computed(() => store.config.frontpage);
const language = computed(() => store.language);


onMounted(() => {
    console.log(`Mounted: AccordionItems`)

});
</script>

<template>
    <div class="accordion-item" :id="id">
        <h2 class="accordion-header" :id="'heading_'+id">
        <button :style='"background-color: #" + color + ";"'  class="accordion-button collapsed" type="button" data-bs-toggle="collapse" :data-bs-target="'#collapse_'+id" aria-expanded="false" aria-controls="collapseTwo">
            {{title }}             
        </button>
        </h2>
        <div :id="'collapse_'+id" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
        <div class="accordion-body" :style='"background-color: #" + color + ";"' >
            <ul class="row m-0 ps-3" >
                <li class="col-md-4 ps-2 " v-for="item in items" :key='item' >
                    {{ item[language] }}
                    <!-- <Carousel/> -->
                </li>
            </ul>   
        </div>
        </div>
    </div>    
</template>