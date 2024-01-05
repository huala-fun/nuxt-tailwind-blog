<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>
<script setup lang="ts">
const title = "BLOG";

useHead({
  titleTemplate: (titleChunk) => {
    return titleChunk ? `${title} - ${titleChunk}` : title;
  },
});
</script>
