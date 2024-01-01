<template>
  <AppLayout>
    <NuxtPage />
  </AppLayout>
</template>
<script setup lang="ts">
const title = "BLOG"
useHead({
  titleTemplate: (titleChunk) => {
    return titleChunk ? `${title} - ${titleChunk}` : title;
  },
});
</script>
<style>
/* 通用滚动条样式，适用于所有滚动条 */
*::-webkit-scrollbar {
  width: 4px !important;
  height: 4px !important;
}

*::-webkit-scrollbar-track {
  background-color: transparent;
}

*::-webkit-scrollbar-thumb {
  background-color: #888;
  border-radius: 4px;
}

*::-webkit-scrollbar-thumb:hover {
  background-color: #555;
}
</style>
