<script setup >
import { onMounted, computed } from "vue";
import { useStore } from '../stores/config.js'
const store = useStore()
const config = computed(() => store.config.navbar);
const language = computed(() => store.language);

onMounted(() => {
    console.log(`Mounted: NavBar`)

});
</script>

<template>
  <nav id="Navbar" class="navbar sticky-top navbar-expand navbar-dark bg-dark">
    <div v-if="config" class="container-fluid">

      <a class="navbar-brand m-0 p-0" href="#">
        <i class="bi bi-house-fill" style="font-size: 1.5rem;"></i>
      </a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li v-for=" link in config.links" :key=link.text class="nav-item">
            <a class="nav-link" :href="link.href">{{link.text[language]}}</a>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              {{config.menutext[language]}}
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li  v-for=" dropdown in config.dropdowns" :key=dropdown.text  ><a class="dropdown-item" :href="dropdown.href">{{dropdown.text[language]}}</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <!-- <img v-if="store.language=='en'" :src="config.images.language_us" height="30" alt="" data-bs-toggle="modal" data-bs-target="#ModalLanguage">
      <img v-if="store.language=='hu'" :src="config.images.language_hu" height="30" alt="" data-bs-toggle="modal" data-bs-target="#ModalLanguage"> -->
      <a class="navbar-brand m-0 p-0" alt="" data-bs-toggle="modal" data-bs-target="#ModalLanguage">
        <i class="bi bi-gear" style="font-size: 1.5rem;"></i>
      </a>
    </div>
  </nav>
</template>