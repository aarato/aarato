<script setup >
import { onMounted, computed} from "vue";
import { useStore } from '../stores/config.js'
const store = useStore()
const config = computed(() => store.config.frontpage);
const language = computed(() => store.language);
onMounted(() => {
    console.log(`Mounted: PageFrontCarousel`)
});
</script>

<template>
        <div id="carouselQuotes" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner bg-transparent">
            <div class="carousel-item" :class="{ active: index == 0 }" v-for=" ( quote, index ) in config.carousel" :key='quote.title'>
              <div class="container d-flex align-items-center justify-content-center ">
                <figure class="text-center m-0">
                  <blockquote class="blockquote px-5">
                    <p>{{quote.title[language]}}</p>
                  </blockquote>
                  <figcaption class="blockquote-footer mb-0">
                    <cite title="Source Title">{{quote.subtitle[language]}}</cite>
                  </figcaption>
                </figure>   
              </div>
            </div>
          </div>

          <a class="carousel-control-prev" type="button" data-bs-target="#carouselQuotes"  data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          </a>
          <a class="carousel-control-next" type="button" data-bs-target="#carouselQuotes"  data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
          </a>
        </div>
</template>