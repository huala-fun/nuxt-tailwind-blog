<template>
  {{route.path}}
</template>

<script setup>
const route = useRoute();

useHead({
  title: `标签 - ${route.params.slug}`,
});
</script>
