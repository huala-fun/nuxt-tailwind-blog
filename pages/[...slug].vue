<template>
  <Card>
    <ContentDoc :path="$route.path" />
  </Card>
  <Icon
    v-show="isShowTop"
    @click="backToTop"
    name="bi:arrow-up-square"
    class="w-7 h-7 cursor-pointer border-none rounded-md fixed right-4 bottom-10 dark:bg-white dark:text-slate-500" />
</template>

<script setup>
import { createApp } from "vue";
const route = useRoute();
const isPost = route.path.startsWith("/post");
import CodeCopyButton from "~/components/CodeCopyButton.vue";

const isShowTop = ref(false);

const backToTop = () => {
  window.scrollTo({
    top: 0,
    behavior: "smooth",
  });
};

const handleScroll = () => {
  if (window.scrollY > 100) {
    isShowTop.value = true;
  } else {
    isShowTop.value = false;
  }
};

onMounted(() => {
  window.addEventListener("scroll", handleScroll);
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
