<template>
  <blockquote
    class="bg-slate-100 inline-flex px-2 w-full dark:bg-gray-600 rounded-r-md">
    <slot />
  </blockquote>
</template>

<style scoped>
blockquote {
  @apply text-base;
}
blockquote ::v-deep(p) {
  @apply py-0 my-2;
}
</style>
