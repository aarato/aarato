import { defineStore } from 'pinia'
import YAML from 'yaml'

export const useStore = defineStore('storeId', {
  state: () => {
    return {
      ready: false,
      language: "en",
      config : {}
    }
  },
  actions: {
    async fetchYaml(url) {
      try {
        const response = await fetch(url)
        if (!response.ok) {
          console.log(`HTTP error! status: ${response.status}`)
        }
        // Store the YAML content as a string
        const yamlString = await response.text()
        this.config = YAML.parse(yamlString, 'utf-8')
        this.ready = true

        
      } catch (error) {
        console.error('Error fetching the YAML file:', error)
      }
    },    
  },  
})