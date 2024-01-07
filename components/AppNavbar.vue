<script lang="ts" setup>
const appConfig = useAppConfig();
</script>

<template>
  <div class="flex justify-center px-4 py-4 mx-auto sm:px-8 gap-4">
    <!-- Navigation -->
    <div class="text-gray-700 dark:text-gray-200 flex gap-4">
      <NuxtLink key="/" to="/" active-class="font-bold"> 首页 </NuxtLink>
      <NuxtLink key="/about" to="/about" active-class="font-bold">
        关于
      </NuxtLink>
    </div>
    <!-- Social icons & Color Mode -->
    <div class="transition text-gray-500 flex gap-4">
      <a
        v-if="appConfig.socials?.github"
        :href="`https://github.com/${appConfig.socials?.github}`"
        target="_blank"
        title="GitHub"
        class="dark:text-gray-100 hover:text-gray-700 dark:hover:text-gray-300"
        ><Icon name="fa-brands:github" class="w-5 h-5"
      /></a>
      <ColorModeSwitch
        class="dark:text-gray-100 hover:text-gray-700 dark:hover:text-gray-300" />
    </div>
  </div>
</template>
