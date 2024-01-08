<template>
  <div
    class="copy absolute top-3 right-3 w-4 inline-flex cursor-pointer text-slate-800 dark:text-slate-300">
    <IconsOcticonCopy16 v-show="!copyState" class="w-4 h-4 stroke-gray-300" />
    <IconsBiCheckLg v-show="copyState" class="w-4 h-4 stroke-gray-300" />
  </div>
</template>

<script setup lang="ts">
import Clipboard from "clipboard";
const copyState = ref(false);

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
