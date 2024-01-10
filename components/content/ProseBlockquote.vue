<template>
  <blockquote
    class="">
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
