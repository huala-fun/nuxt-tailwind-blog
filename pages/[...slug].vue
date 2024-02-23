<template>
  <Card>
    <ContentDoc :path="$route.path" />
  </Card>
  <!-- <IconsTablerArrowBarToUp
    v-show="isShowTop"
    @click="backToTop"
    class="w-7 h-7 cursor-pointer border-none rounded-md fixed right-4 bottom-10 dark:bg-white dark:text-slate-500" /> -->
</template>

<script setup>
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
  window.addEventListener("scroll", watchScroll);
});
</script>
