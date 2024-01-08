<template>
  <Card class="posts">
    <ContentDoc :path="$route.path" />
  </Card>
  <div
    v-show="showBackTop"
    @click="backTop"
    class="w-8 h-8 flex justify-center items-center fixed right-4 bottom-4 text-white cursor-pointer bg-blue-500 rounded-full m-4">
    <IconsTdesignBacktop class="w-5 h-5 text-white" />
  </div>
</template>

<script setup>
import { CodeCopyButton } from "#components";
import { render, createApp } from "vue";
const showBackTop = ref(false);

const backTop = () => {
  window.scrollTo({
    top: 0,
    behavior: "smooth",
  });
};

const handleScroll = () => {
  showBackTop.value = window.scrollY > 350;
};
onMounted(() => {
  window.addEventListener("scroll", handleScroll);
});
onUnmounted(() => {
  window.removeEventListener("scroll", handleScroll);
});

onMounted(() => {
  setTimeout(() => {
    const blocks = document.querySelectorAll("pre");
    for (const block of blocks) {
      const div = document.createElement("div");
      const vnode = h(CodeCopyButton);
      block.style.position = "relative";
      render(vnode, div);
      block.appendChild(vnode.el);
    }
  }, 100);
});
</script>
