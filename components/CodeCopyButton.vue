<template>
  <button id="copy" ref="copy" class="copy absolute top-1 right-2 bg-slate-500   dark:bg-slate-200  rounded-sm w-8 h-5 text-sm dark:text-gray-600">
    {{ state }}
  </button>
</template>

<script setup>
import Clipboard from "clipboard";
const state = ref("Copy");
onMounted(() => {
  const copyCode = new Clipboard(".copy", {
    target(trigger) {
      return trigger.previousElementSibling;
    },
  });
  let timeout = null;
  copyCode.on("success", (event) => {
    event.clearSelection();
    state.value = "OK";
    clearTimeout(timeout);
    timeout = window.setTimeout(() => {
      state.value = "Copy";
    }, 2000);
  });
});
</script>