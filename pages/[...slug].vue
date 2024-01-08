<template>
  <Card class="posts">
    <ContentDoc :path="$route.path" />
  </Card>
  <IconsTdesignBacktop
    @click="backTop"
    v-show="showBackTop"
    class="w-6 h-6 fixed right-4 bottom-8 cursor-pointer" />
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
  const route = useRoute();
  const isPost = route.path.startsWith("/post");
  if (isPost) {
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
  }
});
</script>
