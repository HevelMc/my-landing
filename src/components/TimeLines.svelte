<script lang="ts">
  import { fly, slide } from "svelte/transition";
  import TimeElement from "./TimeElement.svelte";

  let isRightSide = false;
</script>

<section id="experience" class="flex flex-col items-center">
  <div class="sm:hidden mb-4">
    <select
      id="tabs"
      class="border text-sm rounded-lg focus:ring-from focus:border-from block w-full p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 text-white"
    >
      <option>Éxperiences</option>
      <option>Formations</option>
    </select>
  </div>
  <ul
    class="hidden mb-4 text-sm font-medium text-center divide-x rounded-lg shadow sm:flex divide-gray-700 text-gray-400"
  >
    <li class="w-full">
      <button
        class="inline-block w-full p-4 rounded-l-lg hover:text-white hover:bg-gray-700 {!isRightSide
          ? 'text-white bg-gray-700'
          : 'bg-gray-800'}"
        on:click={() => {
          isRightSide = false;
        }}
        aria-current="page">Éxperiences</button
      >
    </li>
    <li class="w-full">
      <button
        class="inline-block w-full p-4 rounded-r-lg hover:text-white hover:bg-gray-700 {isRightSide
          ? 'text-white bg-gray-700'
          : 'bg-gray-800'}"
        on:click={() => {
          isRightSide = true;
        }}>Formations</button
      >
    </li>
  </ul>
  {#if !isRightSide}
    <ol
      class="relative border-l border-gray-700 mb-20 flex flex-col gap-6 max-w-2xl"
      in:fly="{{ x: -200, duration: 200 }}"
    >
      <TimeElement
        title="42Nice BDE - Pôle IT"
        subtitle="janvier 2023 - aujourd'hui"
        description="Membre du Bureau Des Étudiants de 42Nice, nous organisons des événements pour les étudiants de 42."
        start={new Date(2023, 0, 0)}
        end={new Date()}
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-3 h-3 text-light"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M11.42 15.17L17.25 21A2.652 2.652 0 0021 17.25l-5.877-5.877M11.42 15.17l2.496-3.03c.317-.384.74-.626 1.208-.766M11.42 15.17l-4.655 5.653a2.548 2.548 0 11-3.586-3.586l6.837-5.63m5.108-.233c.55-.164 1.163-.188 1.743-.14a4.5 4.5 0 004.486-6.336l-3.276 3.277a3.004 3.004 0 01-2.25-2.25l3.276-3.276a4.5 4.5 0 00-6.336 4.486c.091 1.076-.071 2.264-.904 2.95l-.102.085m-1.745 1.437L5.909 7.5H4.5L2.25 3.75l1.5-1.5L7.5 4.5v1.409l4.26 4.26m-1.745 1.437l1.745-1.437m6.615 8.206L15.75 15.75M4.867 19.125h.008v.008h-.008v-.008z"
          />
        </svg>
      </TimeElement>
      <TimeElement
        title="Andralude - Co-fondateur & Développeur"
        subtitle="mai 2021 - aujourd'hui"
        description="Andralude crée des jeux et des expériences ludiques sur-mesure pour tous les publics. Nous proposons également l'application Secret Friend qui encourage les actes de bienveillance en entreprise."
        start={new Date(2021, 4, 0)}
        end={new Date()}
        links={[
          { name: "Andralude", url: "https://andralude.com" },
          { name: "Secret Friend", url: "https://secretfriend.fr" },
        ]}
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-3 h-3 text-light"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M17.25 6.75L22.5 12l-5.25 5.25m-10.5 0L1.5 12l5.25-5.25m7.5-3l-4.5 16.5"
          />
        </svg>
      </TimeElement>
      <TimeElement
        title="Electryon - Fondateur"
        subtitle="janv. 2017 - sept. 2020"
        description="Serveur Minecraft à but non Lucratif."
        start={new Date(2017, 0, 0)}
        end={new Date(2020, 6, 0)}
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-3 h-3 text-light"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M21 7.5l-9-5.25L3 7.5m18 0l-9 5.25m9-5.25v9l-9 5.25M3 7.5l9 5.25M3 7.5v9l9 5.25m0-9v9"
          />
        </svg>
      </TimeElement>
    </ol>
  {/if}
  {#if isRightSide}
    <ol
      class="relative border-l border-gray-700 mb-20 flex flex-col gap-6 max-w-2xl"
      in:fly="{{ x: 200, duration: 200 }}"
    >
      <TimeElement
        title="42Nice - École de programmation"
        subtitle="nov. 2022 - aujourd'hui"
        description="42 est une école de programmation à la méthode d'apprentissage inédite et novatrice. Elle propose un cursus basé sur la pratique et le peer-learning.
Activités et associations : Membre du Bureau Des Étudiants."
        start={new Date(2022, 10, 7)}
        end={new Date()}
        links={[{ name: "42Nice", url: "https://42nice.fr" }]}
      >
        <svg
          version="1.1"
          id="Calque_1"
          x="0px"
          y="0px"
          viewBox="0 -200 960 960"
          enable-background="new 0 -200 960 960"
          xml:space="preserve"
          class="w-3 h-3 fill-light"
        >
          <polygon
            id="polygon5"
            points="32,412.6 362.1,412.6 362.1,578 526.8,578 526.8,279.1 197.3,279.1 526.8,-51.1 362.1,-51.1   32,279.1 "
          />
          <polygon
            id="polygon7"
            points="597.9,114.2 762.7,-51.1 597.9,-51.1 "
          />
          <polygon
            id="polygon9"
            points="762.7,114.2 597.9,279.1 597.9,443.9 762.7,443.9 762.7,279.1 928,114.2 928,-51.1 762.7,-51.1 "
          />
          <polygon id="polygon11" points="928,279.1 762.7,443.9 928,443.9 " />
        </svg>
      </TimeElement>
      <TimeElement
        title="Lycée Bristol de Cannes - Baccalauréat Scientifique"
        subtitle="sep. 2019 - juillet 2022"
        description="Niveau : Baccalauréat - Mention très bien
Activités et associations : Membre du conseil de vie lycéenne et de la maison des lycéens, délégué de classe."
        start={new Date(2019, 8, 1)}
        end={new Date(2022, 6, 1)}
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-3 h-3 text-light"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M4.26 10.147a60.436 60.436 0 00-.491 6.347A48.627 48.627 0 0112 20.904a48.627 48.627 0 018.232-4.41 60.46 60.46 0 00-.491-6.347m-15.482 0a50.57 50.57 0 00-2.658-.813A59.905 59.905 0 0112 3.493a59.902 59.902 0 0110.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.697 50.697 0 0112 13.489a50.702 50.702 0 017.74-3.342M6.75 15a.75.75 0 100-1.5.75.75 0 000 1.5zm0 0v-3.675A55.378 55.378 0 0112 8.443m-7.007 11.55A5.981 5.981 0 006.75 15.75v-1.5"
          />
        </svg>
      </TimeElement>
      <TimeElement
        title="Collège Albert Camus - Études Générales"
        subtitle="sep. 2019 - juillet 2022"
        description="Niveau : Diplôme national du brevet (DNB) - Mention très bien
Activités et associations : Délégué de classe, membre du Conseil de vie Collégienne."
        start={new Date(2019, 8, 1)}
        end={new Date(2022, 6, 1)}
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-3 h-3 text-light"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M12 21v-8.25M15.75 21v-8.25M8.25 21v-8.25M3 9l9-6 9 6m-1.5 12V10.332A48.36 48.36 0 0012 9.75c-2.551 0-5.056.2-7.5.582V21M3 21h18M12 6.75h.008v.008H12V6.75z"
          />
        </svg>
      </TimeElement>
    </ol>
  {/if}
</section>
