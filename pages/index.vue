<template>
  <div class="max-w-2xl mx-auto">
    <ContentList path="/post">
      <template #default="{ list }">
        <div class="flex flex-col gap-4">
          <NuxtLink
            v-for="article in list"
            :key="article._path"
            :to="article._path">
            <div
              class="px-4 py-6 bg-white sm:px-8 sm:shadow dark:bg-gray-800 ring-1 ring-gray-200 dark:ring-gray-700 sm:rounded-lg">
              <div class="text-lg font-bold">
                {{ article.title }}
              </div>
              <p>{{ article.description }}</p>
            </div>
          </NuxtLink>
        </div>
      </template>
      <template #not-found>
        <p>No articles found.</p>
      </template>
    </ContentList>
  </div>
</template>
