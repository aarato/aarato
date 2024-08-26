<script setup >
import { onMounted, computed } from "vue";
import { Modal } from 'bootstrap';
import { useStore } from '../stores/config.js'
const store = useStore()
const config = computed(() => store.config.frontpage);
const language = computed(() => store.language);

const name = "ModalLanguage"
function selectEN( ) {
      console.log("EN")
      store.language="en"
      setCookie(name,store.language)
      hideModal(name)   
  }

function selectHU( ) {
      console.log("HU")
      store.language="hu"
      setCookie(name,store.language)
      hideModal(name)
  }

function hideModal(name) {
      let myModalEl = document.getElementById(name)
      var modal = Modal.getInstance(myModalEl) 
      modal.hide()        
      console.log(`Hidemodal: ${language}`)     
  }

function showModal(name) {
  let myModalEl = document.getElementById(name)
  var modal = Modal.getOrCreateInstance(myModalEl) 
  modal.show()   
  }

function setCookie(name,value,days) {
      var expires = "";
      if (days) {
          var date = new Date();
          date.setTime(date.getTime() + (days*24*60*60*1000));
          expires = "; expires=" + date.toUTCString();
      }
      document.cookie = name + "=" + (value || "")  + expires + "; path=/";
  }
function getCookie(name) {
      var nameEQ = name + "=";
      var ca = document.cookie.split(';');
      for(var i=0;i < ca.length;i++) {
          var c = ca[i];
          while (c.charAt(0)==' ') c = c.substring(1,c.length);
          if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
      }
      return null;
  }

onMounted(() => {
  const language = getCookie(name)
    if ( store.language ) {
      store.language = store.language  
    }
    else{
      showModal(name)  
    }
  console.log(`Mounted: ModalLanguage: ${language}`)
});
</script>

<template>
  <div v-if="name" class="modal fade" :id="name"  tabindex="-1" :aria-labelledby="name+'label'" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered">
      <div class="modal-content">
        <!-- <div class="modal-header">
          <h5 class="modal-title" :id="name+'label'"></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div> -->
        <div class="modal-body">
          <ul v-if="config" class="list-group">
            <li @click="selectEN()" class="list-group-item list-group-item-action" :class=" store.language == 'en' ? 'active' : '' ">
              <img :src="config.images.language_us" height="30" alt=""> English (US)
            </li>
            <li @click="selectHU()" class="list-group-item list-group-item-action" :class=" store.language == 'hu' ? 'active' : '' ">
              <img :src="config.images.language_hu" height="30" alt="" > Magyar (HU)
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div> 
  </template>
  