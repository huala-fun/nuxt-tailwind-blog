<template>
  <Card>
    <ContentDoc :path="$route.path" />
  </Card>
</template>

<script setup>
import { createApp } from "vue";
const route = useRoute();
const isPost = route.path.startsWith("/post");
import CodeCopyButton from "~/components/CodeCopyButton.vue";

onMounted(() => {
  if (isPost) {
    console.log("ddd");
    setTimeout(() => {
      const blocks = document.querySelectorAll("pre");
      for (const block of blocks) {
        const el = document.createElement("div");
        createApp(CodeCopyButton).mount(el);
        block.appendChild(el.firstElementChild);
        block.style.position = "relative";
      }
    }, 100);
  }
});
</script>
