<template>
  <button
    v-show="isShowCopy"
    ref="copyRef"
    class="copy absolute top-2 right-2 border rounded-md p-1 border-slate-500 text-slate-500 dark:border-slate-600 dark:text-slate-400">
    <IconsClipboardCheck v-if="copyState" class="w-5 h-5" />
    <IconsClipboardCopy v-else class="w-5 h-5" />
  </button>
</template>

<script setup>
import Clipboard from "clipboard";
const copyState = ref(false);
const copyRef = ref(null);
const props = defineProps(["block"]);

const isShowCopy = ref(false);

const handlePreBlockHover = (block) => {
  const mouseoverHandler = () => {
    isShowCopy.value = true;
  };

  const mouseoutHandler = () => {
    isShowCopy.value = false;
  };

  onMounted(() => {
    block.addEventListener("mouseover", mouseoverHandler);
    block.addEventListener("mouseout", mouseoutHandler);
  });

  onUnmounted(() => {
    block.removeEventListener("mouseover", mouseoverHandler);
    block.removeEventListener("mouseout", mouseoutHandler);
  });
};

// 调用函数并传递 block
handlePreBlockHover(props.block);

/**
 * 处理代码复制
 */
const handleCodeCopy = () => {
  const copyCode = new Clipboard(".copy", {
    target(trigger) {
      return trigger.previousElementSibling;
    },
  });
  let timeout = null;


  
  copyCode.on("success", (e) => {
    e.clearSelection();
    copyState.value = true;
    clearTimeout(timeout);
    timeout = setTimeout(() => (copyState.value = false), 1000);
  });
};

onMounted(() => {
  handlePreBlockHover();
  handleCodeCopy();
});
</script>
