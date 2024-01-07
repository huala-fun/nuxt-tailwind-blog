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
</script>
