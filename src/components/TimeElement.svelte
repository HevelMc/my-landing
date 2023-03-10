<script lang="ts">
export let start: Date;
export let end: Date;
export let title: string;
export let subtitle: string;
export let description: string;
export let links: any[] = [];

function durationSince(start: Date, end: Date): string {
    let days = Math.floor((end.getTime() - start.getTime()) / (1000 * 60 * 60 * 24));
    let str = '';
    if (days > 30) {
      let years = 0;
      if (days > 365) {
        while (days > 365) {
          days -= 365;
          years++;
        }
        str += years + ' year' + (years > 1 ? 's' : '');
      }
      const months = Math.floor(days / 30);
      if (months > 0)
      {
        if (years > 0) str += ' and ';
        str += months + ' month' + (months > 1 ? 's' : '');
      }
    } else {
      str += days + ' day' + (days > 1 ? 's' : '');
    }
    return str;
  }
</script>

<li class="ml-6">
  <span class="absolute flex items-center justify-center w-6 h-6 rounded-full -left-4 ring-8 ring-gray-900 bg-dark">
    <slot />
  </span>
  <h3 class="flex items-center mb-1 text-lg font-semibold text-white">{title}</h3>
  <time class="block mb-2 text-sm font-normal leading-none text-gray-500">{subtitle} · {durationSince(start, end)}</time>
  <p class="text-base font-normal text-gray-400 {links.length > 0 ? 'mb-4' : ''} whitespace-pre-line">{description}</p>
  { #each links as link }
    <a href={link.url} target="_blank" rel="noreferrer" class="inline-flex items-center px-4 py-2 text-sm font-medium border rounded-lg bg-gray-800 text-gray-400 border-gray-600 hover:text-white hover:bg-gray-700 focus:ring-gray-700 mr-2"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 mr-2"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 6H5.25A2.25 2.25 0 003 8.25v10.5A2.25 2.25 0 005.25 21h10.5A2.25 2.25 0 0018 18.75V10.5m-10.5 6L21 3m0 0h-5.25M21 3v5.25" /></svg>{link.name}</a>
  { /each }
</li>