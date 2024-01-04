<script lang="ts">
  import { fly } from "svelte/transition";
  import TimeElement from "./TimeElement.svelte";
  import { onMount } from "svelte";
  import axios from "axios";

  let isRightSide = false;

  let experiences: any[] = [];
  let formations: any[] = [];

  onMount(() => {
    axios.get("https://back.alopez.fr/items/experiences?fields=*,links.*,icon").then((res) => {
      experiences = res.data.data.filter((item: any) => item.type === "experience");
      formations = res.data.data.filter((item: any) => item.type === "formation");
    });
  });

  function changeSelect(e: Event) {
    isRightSide = (e.target as HTMLSelectElement).value === "Formations";
  }
</script>

<section id="experience" class="flex flex-col items-center ml-8 mr-4">
  <div class="sm:hidden mb-4">
    <select id="tabs" class="border text-sm rounded-lg focus:ring-from focus:border-from block w-full py-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 text-white" on:change={changeSelect}>
      <option>Éxperiences</option>
      <option>Formations</option>
    </select>
  </div>
  <ul class="hidden mb-4 text-sm font-medium text-center divide-x rounded-lg shadow sm:flex divide-gray-700 text-gray-400">
    <li class="w-full">
      <button
        class="inline-block w-full p-4 rounded-l-lg hover:text-white hover:bg-gray-700 {!isRightSide ? 'text-white bg-gray-700' : 'bg-gray-800'}"
        on:click={() => {
          isRightSide = false;
        }}
        aria-current="page"
      >
        Éxperiences
      </button>
    </li>
    <li class="w-full">
      <button
        class="inline-block w-full p-4 rounded-r-lg hover:text-white hover:bg-gray-700 {isRightSide ? 'text-white bg-gray-700' : 'bg-gray-800'}"
        on:click={() => {
          isRightSide = true;
        }}
      >
        Formations
      </button>
    </li>
  </ul>
  {#if !isRightSide}
    <ol class="relative border-l border-gray-700 mb-20 flex flex-col gap-6 max-w-2xl" in:fly={{ x: -200, duration: 200 }}>
      {#each experiences as experience}
        <TimeElement title={experience.title} description={experience.description} start={new Date(experience.start_date)} end={experience.end_date ? new Date(experience.end_date) : null} links={experience.links} icon={experience.icon} />
      {/each}
    </ol>
  {/if}
  {#if isRightSide}
    <ol class="relative border-l border-gray-700 mb-20 flex flex-col gap-6 max-w-2xl" in:fly={{ x: -200, duration: 200 }}>
      {#each formations as formation}
        <TimeElement title={formation.title} description={formation.description} start={new Date(formation.start_date)} end={formation.end_date ? new Date(formation.end_date) : null} links={formation.links} icon={formation.icon} />
      {/each}
    </ol>
  {/if}
</section>
