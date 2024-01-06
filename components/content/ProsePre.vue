<template>
  <pre :class="`${$props.class} relative flex`"><slot /> 
    <div class="copy absolute top-3 right-3 inline-flex cursor-pointer text-slate-800 dark:text-slate-300">
      <IconsOcticonCopy16 v-show="!copyState"  class="w-4 h-4  stroke-gray-300" />
      <IconsBiCheckLg v-show="copyState"  class="w-4 h-4 stroke-gray-300" />
    </div></pre>
</template>

<script setup lang="ts">
import Clipboard from "clipboard";
console.log();

const copyState = ref(false);
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

onMounted(() => {
  const copyCode = new Clipboard(".copy", {
    target(trigger) {
      return trigger.previousElementSibling!;
    },
  });

  let timeout: any = null;
  copyCode.on("success", (e) => {
    e.clearSelection();
    copyState.value = true;
    clearTimeout(timeout);
    timeout = setTimeout(() => (copyState.value = false), 1000);
  });
});
</script>

<style scoped>
pre code .line {
  display: block;
}
</style>
