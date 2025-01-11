/*import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()]
})*/

// https://vitejs.dev/config/
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { visualizer } from 'rollup-plugin-visualizer'

export default defineConfig({
  plugins: [react(), visualizer()],
  build: {
    rollupOptions: {
      output: {
        // Override the default asset file naming function
        assetFileNames: (assetInfo) => {
          // Check if the file is an image (adjust the condition based on your needs)
          if (
            assetInfo.name.endsWith('.png') ||
            assetInfo.name.endsWith('.jpg')
          ) {
            return 'assets/[name].[ext]'
          }
          // Fallback to default naming for other files
          return 'assets/[name].[hash][ext]'
        },
      },
    },
  },
})
