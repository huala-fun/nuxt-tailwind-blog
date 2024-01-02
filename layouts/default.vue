<template>
  <div
    class="min-h-screen bg-gray-50 text-black dark:bg-gray-900 dark:text-white">
    <main class="sm:pt-6 sm:pb-10 max-w-2xl mx-auto">
      <NuxtLoadingIndicator />
      <AppNavbar />
      <div
        class="max-w-none prose dark:prose-invert prose-pre:bg-gray-100 dark:prose-pre:bg-gray-900 hover:prose-a:text-primary-400 prose-a:font-normal prose-a:no-underline prose-a:border-dashed prose-a:border-b hover:prose-a:border-solid hover:prose-a:border-primary-400">
        <slot />
      </div>
    </main>
  </div>
</template>
