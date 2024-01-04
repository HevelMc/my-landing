<script lang="ts">
  import { onMount } from "svelte";

  onMount(() => {
    addEventListener("mousemove", followMouse);
    spawn_bubbles();
  });

  function scrollSection(id: string) {
    const el = document.getElementById(id);
    if (!el) return;
    el.scrollIntoView({ behavior: "smooth" });
  }

  function followMouse(event: MouseEvent) {
    let el = document.getElementById("cursor-blur");
    if (!el) return;
    el.style.visibility = "visible";

    el.style.left = event.clientX + "px";
    el.style.top = event.clientY + "px";

    // change the opacity of el based on the distance from the center of welcome
    let welcome = document.getElementById("welcome");
    if (!welcome) return;
    let welcomeRect = welcome.getBoundingClientRect();
    let welcomeCenterX = welcomeRect.left + welcomeRect.width / 2;
    let welcomeCenterY = welcomeRect.top + welcomeRect.height / 2;
    let distance = Math.sqrt(Math.pow(event.clientX - welcomeCenterX, 2) + Math.pow(event.clientY - welcomeCenterY, 2));
    let opacity = 0.3 - distance / 2000;
    el.style.opacity = opacity.toString();
  }

  function spawn_bubbles() {
    let main = document.getElementById("hero");
    if (!main) return;
    let mainRect = main.getBoundingClientRect();
    let mainWidth = mainRect.width;
    let mainHeight = mainRect.height;

    console.log(mainWidth, mainHeight);

    const bubbles = document.getElementsByClassName("bubble");

    for (let i = 0; i < bubbles.length; i++) {
      let bubble = bubbles[i] as HTMLElement;
      bubble.style.scale = Math.random() * 1.5 + 1 + "";
      let x = Math.random() * mainWidth - mainWidth / 2;
      let y = Math.random() * mainHeight - mainHeight / 2;
      bubble.style.transform = `translate(${x}px, ${y}px)`;
      bubble.style.visibility = "visible";
      bubble.style.transition = "transform 3s";

      setInterval(() => {
        let x = Math.random() * mainWidth - mainWidth / 2;
        let y = Math.random() * mainHeight - mainHeight / 2;
        bubble.style.transform = `translate(${x}px, ${y}px)`;
      }, 3000);
    }
  }
</script>

<section id="hero" class="py-32 md:py-48 select-none flex flex-grow-0 flex-col items-center justify-center touch-none">
  <div class="flex flex-col items-center">
    <div class="flex flex-col md:flex-row items-center gap-4">
      <img src="/alopez-circle.png" alt="alopez" class="w-48 h-48 md:w-24 md:h-24 rounded-full object-cover" />
      <div class="flex items-center">
        <span id="welcome" class="text-3xl md:text-5xl font-bold text-white self-center mx-6">Welcome</span>
        <span class="text-3xl md:text-5xl font-bold text-white self-center">
          <img style="content: var(--image); scale: var(--size);" alt="wave" class="wave transition-all w-12 h-12" />
        </span>
      </div>
    </div>
    <p class="text-white text-center text-2xl mt-12 mx-4">
      I'm <span class="font-bold animate-text bg-gradient-to-r bg-clip-text text-transparent from-from to-to">Axel Lopez</span>
    </p>
    <p class="text-white text-center text-2xl mx-4">
      A <span class="font-bold animate-text bg-gradient-to-r from-slate-300 to-slate-400 bg-clip-text text-transparent">software developer</span>
      and student at
      <span class="font-bold animate-text bg-gradient-to-r from-slate-300 to-slate-400 bg-clip-text text-transparent">42 Nice</span>
    </p>

    <span class="flex justify-center mt-12">
      <button on:click={() => scrollSection("experience")}>
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8 animate-bounce cursor-pointer stroke-white">
          <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
        </svg>
      </button>
    </span>
  </div>
  <div id="cursor-blur" class="w-64 h-64 bg-gradient-to-r from-from to-to rounded-full opacity-[12%] blur-3xl fixed -translate-x-1/2 -translate-y-1/2 -z-10 invisible"></div>

  <div class="bubble w-64 h-64 bg-gradient-to-r from-from to-to rounded-full opacity-[12%] blur-3xl fixed -translate-x-1/2 -translate-y-1/2 -z-10 invisible"></div>
  <div class="bubble w-64 h-64 bg-gradient-to-r from-from to-to rounded-full opacity-[12%] blur-3xl fixed -translate-x-1/2 -translate-y-1/2 -z-10 invisible"></div>
  <div class="bubble w-64 h-64 bg-gradient-to-r from-from to-to rounded-full opacity-[12%] blur-3xl fixed -translate-x-1/2 -translate-y-1/2 -z-10 invisible"></div>
</section>

<style>
  :global(.wave) {
    animation-name: wave-animation;
    animation-duration: 2.5s;
    animation-iteration-count: infinite;
    transform-origin: 70% 70%;
    display: inline-block;
  }

  @keyframes wave-animation {
    0% {
      transform: rotate(0deg);
    }
    10% {
      transform: rotate(14deg);
    }
    20% {
      transform: rotate(-8deg);
    }
    30% {
      transform: rotate(14deg);
    }
    40% {
      transform: rotate(-4deg);
    }
    50% {
      transform: rotate(10deg);
    }
    60% {
      transform: rotate(0deg);
    }
    100% {
      transform: rotate(0deg);
    }
  }
</style>
