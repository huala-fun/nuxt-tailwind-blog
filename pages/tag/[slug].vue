<template>
  {{params.path}}
</template>

<script setup>
const {params} = useRoute();
const { data } = await useAsyncData('home', () => queryContent('/').findOne())

console.log(data);

useHead({
  title: `标签 - ${params.slug}`,
});
</script>
