<template>
  <code><slot /></code>
</template>

<style scoped>
code::before,
code::after {
  content: "" !important;
}

code {
  @apply  bg-green-200 p-[2px] px-1 rounded-md dark:text-black dark:bg-green-500 mx-1;
}
</style>
