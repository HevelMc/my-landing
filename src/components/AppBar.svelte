<script lang="ts">
  import { slide } from "svelte/transition";
  let isMenuOpen = false;
</script>

<nav>
  <div class="mx-auto max-w-2xl px-2 sm:px-6 lg:px-8 select-none">
    <div class="relative flex h-16 items-center justify-between">
      <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
        <button type="button" on:click={() => (isMenuOpen = !isMenuOpen)} class="inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
          <svg class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
          </svg>
          <svg class="hidden h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
      <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-between">
        <div class="flex flex-shrink-0 items-center">
          <a href="/" class="text-white text-lg font-semibold">
            <span class="text-2xl mr-2 align-middle">🖥️</span>
            Axel Lopez
          </a>
        </div>
        <div class="hidden sm:ml-6 sm:block">
          <div class="flex space-x-4">
            <a href="/" class="bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium" aria-current="page">Home</a>
            <!-- <a href="/" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">My projects</a> -->
          </div>
        </div>
      </div>
    </div>
  </div>

  {#if isMenuOpen}
    <div class="sm:hidden" id="mobile-menu" transition:slide|local>
      <div class="space-y-1 px-2 pt-2 pb-3">
        <a href="/" class="bg-gray-900 text-white block rounded-md px-3 py-2 text-base font-medium" aria-current="page">Home</a>
        <a href="/" class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">My projects</a>
      </div>
    </div>
  {/if}
</nav>
