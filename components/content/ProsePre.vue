<template>
  <pre :class="$props.class" class="flex pr-6"><slot /></pre>
</template>

<script setup lang="ts">
defineProps({
  code: {
    type: String,
    default: "",
  },
  language: {
    type: String,
    default: null,
  },
  filename: {
    type: String,
    default: null,
  },
  highlights: {
    type: Array as () => number[],
    default: () => [],
  },
  meta: {
    type: String,
    default: null,
  },
  class: {
    type: String,
    default: null,
  },
});
</script>

<style scoped>
pre :deep(code) .line {
  display: block;
}

pre :deep(.copy) {
  display: none;
}

pre:hover :deep(.copy) {
  display: inline-flex;
}

pre :deep(code) {
  overflow-x: auto !important;
  @apply py-1;
}
</style>
