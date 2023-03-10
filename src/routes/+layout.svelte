<script>
    import { onMount } from "svelte";
  import "../app.css";
  import AppBar from "../components/AppBar.svelte";

  let isBarbate = false;
  let input = "";

  onMount(() => {
    addEventListener("keydown", (event) => {
      input += event.key;
      input = input.slice(-7).toLowerCase();
      if (input === "barbate") {
        isBarbate = true;
      }
      if (event.key === "Escape") {
        input = "";
        isBarbate = false;
      }
    });
  });
</script>

<div id="layout" class={isBarbate ? "theme-barbate" : "theme-default"}>
  <AppBar />
  <slot />
</div>

<style>
  :global(html) {
    background-color: rgb(7, 7, 16);
  }
</style>