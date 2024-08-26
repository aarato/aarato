<script setup >
import { onMounted, computed, ref, reactive } from "vue";
import { useStore } from '../stores/config.js'

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
const pictureGalleryId = ref("top10");
const inputStyle = ref("400px");
const imgStyle = reactive({
  height: "300px",
  width: "400px",
  "object-fit": "cover"
});


const pictureGallery = computed(() => {
      return store.config.personal.travel.pics
      .filter( picture => {
        let includeThisPicture = picture.tags && picture.tags.includes( pictureGalleryId.value )
        return includeThisPicture
      })
      .filter( picture => {
        picture.key = new Date()
        return picture
      })
    })
function pickPictureGallery(event) {
    pictureGalleryId.value = event.target.value
}
function ImgError(error){
    console.log("MyError:", error)
}

function resize() {
      let elementWidth = document.getElementById('PicturesContainer').offsetWidth;
      let innerHeight = window.innerHeight
      let height = Math.min( parseInt(elementWidth *0.75) , parseInt(innerHeight/2))
      let width  = Math.min( parseInt(height / 0.75), elementWidth)
      imgStyle.height = height + "px"
      imgStyle.width = width + "px"    
      inputStyle.width = width + "px"    
      // console.log(`Carousel resized: ${width}X${height}`)
    }

onMounted(() => {
    resize()
    console.log(`Mounted: PagePersonalTravelPics`)
    // reset the height whenever the window's resized
    window.addEventListener("resize", () => {
        resize()
    })

});
</script>

<template>
  <div class="row mt-2 m-0 justify-content-center">
    <h4 class="p-0">{{config.travel.title[language]}}</h4>

    <div id="PicturesContainer" class="container-fluid justify-content-center text-center px-0 "  >


        <div id="subcontain" class="mx-auto  text-center justify-content-center p-0 m-0" :style="inputStyle">


            <div class="input-group mb-1" >
              <select :style='"background-color: #" + color + ";"' class="form-select"  @change="pickPictureGallery"  aria-label="Default select example">
                <option value="top10">Top 10 Travel Pictures</option>
                <option value="na">North America</option>
                <option value="sa">South/Central America</option>
                <option value="eu">Europe</option>
                <option value="me">Middle East</option>
                <option value="as">Asia</option>
                <option value="af">Africa</option>
                <option value="pa">Pacfic</option>
              </select>          
            </div>



        </div>

        <div id="Pictures" class="carousel slide mx-auto text-center justify-content-center" data-bs-ride="carousel" :style="imgStyle">
            
            <div  class="carousel-inner bg-info">
              <div class="carousel-item" :class="{ active: index == 0 }" v-for=" (pic, index) in pictureGallery" :key='pic.key'>
              <!-- <div class="carousel-item"  v-for=" (pic) in pictureGallery" :key='pic.id'> -->
                    <div class="d-flex align-items-center justify-content-center"> 
                        <img :src="pic.img" :onError='ImgError' class="p-0" :style="imgStyle" alt="...">
                        <div class="carousel-caption ">
                          <h5>{{pic.text[language]}}</h5>
                        </div>            
                    </div>
                </div>
            </div>

            <a class="carousel-control-prev" type="button" data-bs-target="#Pictures"  data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Prev</span>
            </a>
            <a class="carousel-control-next" type="button" data-bs-target="#Pictures"  data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    </div>
  </div>            
</template>