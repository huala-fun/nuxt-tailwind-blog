<template>
  <ContentList path="/post">
    <template #default="{ list }">
      <div class="flex flex-col gap-4">
        <Card v-for="article in list" :key="article._path" :to="article._path">
          <NuxtLink class="text-lg font-bold" :to="article._path">
            {{ article.title }}
          </NuxtLink>
          <p>{{ article.description }}</p>
          <div class="flex gap-2">
            <span
              class="text-gray-400 text-sm cursor-pointer"
              v-for="tag in article.tags"
              >{{ tag }}</span
            >
          </div>
        </Card>
      </div>
    </template>
    <template #not-found>
      <p>No articles found.</p>
    </template>
  </ContentList>
</template>

<script setup>
useHead({
  title: "首页",
});
</script>
