<script lang="ts">
  import { onMount } from "svelte";

  onMount(() => {
    addEventListener("mousemove", followMouse);
  })

  function scrollSection(id: string) {
		const el = document.getElementById(id);
		console.log(el);
		if (!el) return;
		el.scrollIntoView({ behavior: 'smooth' });
	}

  function followMouse(event: MouseEvent) {
    let el = document.getElementById('cursor-blur');
    if (!el) return;
    el.style.left = event.clientX + 'px';
    el.style.top = event.clientY + 'px';

    // change the opacity of el based on the distance from the center of welcome
    let welcome = document.getElementById('welcome');
    if (!welcome) return;
    let welcomeRect = welcome.getBoundingClientRect();
    let welcomeCenterX = welcomeRect.left + welcomeRect.width / 2;
    let welcomeCenterY = welcomeRect.top + welcomeRect.height / 2;
    let distance = Math.sqrt(Math.pow(event.clientX - welcomeCenterX, 2) + Math.pow(event.clientY - welcomeCenterY, 2));
    let opacity = 0.3 - distance / 2000;
    el.style.opacity = opacity.toString();
  }
</script>

<div class="pt-64 pb-64 select-none">
  <div class="flex flex-col items-center">
    <div class="flex">
      <img src="/alopez-circle.png" alt="alopez" class="w-24 h-24 rounded-full object-cover" />
      <span id="welcome" class="text-5xl font-bold text-white self-center mx-6">Welcome</span>
      <span class="text-5xl font-bold text-white self-center"><span class="wave text-6xl">
        <img style="content: var(--image); width: var(--size); height: var(--size);" alt="wave" class="transition-all" />
      </span>
    </div>
    <p class="text-white text-2xl mt-12">I'm <span class="font-bold animate-text bg-gradient-to-r bg-clip-text text-transparent from-from to-to">Axel Lopez</span></p>
    <p class="text-white text-2xl">A <span class="font-bold animate-text bg-gradient-to-r from-slate-300 to-slate-400 bg-clip-text text-transparent">software developer</span> and student at <span class="font-bold animate-text bg-gradient-to-r from-slate-300 to-slate-400 bg-clip-text text-transparent">42 Nice</span></p>
    <p class="text-white text-2xl mt-4"></p>
  
    <span class="flex justify-center mt-12">
      <button on:click={() => scrollSection('experience')}>
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8 animate-bounce cursor-pointer stroke-white">
          <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
        </svg>
      </button>
    </span>
  </div>
  <div id="cursor-blur" class="w-64 h-64 bg-gradient-to-r from-from to-to rounded-full opacity-[12%] blur-3xl absolute -translate-x-1/2 -translate-y-1/2 -z-10"></div>
</div>

<style>
.wave {
  animation-name: wave-animation;
  animation-duration: 2.5s;
  animation-iteration-count: infinite;
  transform-origin: 70% 70%;
  display: inline-block;
}

@keyframes wave-animation {
    0% { transform: rotate( 0.0deg) }
   10% { transform: rotate(14.0deg) }
   20% { transform: rotate(-8.0deg) }
   30% { transform: rotate(14.0deg) }
   40% { transform: rotate(-4.0deg) }
   50% { transform: rotate(10.0deg) }
   60% { transform: rotate( 0.0deg) }
  100% { transform: rotate( 0.0deg) }
}
</style>