<template>
  <main class="b-primary">
    <router-view></router-view>
  </main>
</template>

<script>
import { bus } from "@/main";
export default {
  created() {
    bus.$emit("componentLoaded");
  }
};
</script>

<style lang="scss" scoped>
main {
  max-width: 100vw;
  min-height: 100vh;
  @media screen and(max-width: 768px) {
    padding-bottom: 3rem;
  }
}
</style>
