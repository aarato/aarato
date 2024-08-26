import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  server: {
    port: 8080,  // Specify the port here
    // Other server options can be added here as well
  },  
  preview: {
    port: 8080, // Change this to your desired port
  }
})
