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
import { render } from "vue";
import { CodeCopyButton } from "#components";

const backToTop = () => {
  window.scrollTo({
    top: 0,
    behavior: "smooth",
  });
};

const isShowTop = ref(false);
const watchScroll = () => {
  isShowTop.value = window.scrollY > 100;
};

onMounted(() => {
  const route = useRoute();
  const isPost = route.path.startsWith("/post");
  window.addEventListener("scroll", watchScroll);

  if (isPost) {
    setTimeout(() => {
      const blocks = document.querySelectorAll("pre");
      for (const block of blocks) {
        const div = document.createElement("div");
        const vnode = h(CodeCopyButton, {
          block,
        });
        block.style.position = "relative";
        render(vnode, div);
        block.appendChild(vnode.el);
      }
    }, 100);
  }
});
</script>
