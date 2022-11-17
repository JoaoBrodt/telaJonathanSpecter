const pokemonName = document.querySelector(".pokemon_name");
const pokemonNumber = document.querySelector(".pokemon_number");
const pokemonImage = document.querySelector(".pokemon_image");
const form = document.querySelector(".form");
const input = document.querySelector(".input_search");
const buttonPrev = document.querySelector(".btn-prev");
const buttonNext = document.querySelector(".btn-next");

let searchPokemon = 1;

const fetchPokemon = async (pokemon) => {
  const APIResponse = await fetch(
    `https://pokeapi.co/api/v2/pokemon/${pokemon}`
  );

  if (APIResponse.status == 200) {
    const data = await APIResponse.json();
    return data;
  }
};

const renderPokemon = async (pokemon) => {
  pokemonName.innerHTML = "Carregando...";
  pokemonNumber.innerHTML = "";

  const data = await fetchPokemon(pokemon);
  if (data) {
    pokemonName.innerHTML = "-" + " " + data.name.toUpperCase();
    pokemonNumber.innerHTML = data.id;
    pokemonImage.style.display = "inline-block";
    if (data.id < 650) {
      pokemonImage.src =
        data["sprites"]["versions"]["generation-v"]["black-white"]["animated"][
          "front_default"
        ];
    } else {
      pokemonImage.src =
        data["sprites"]["other"]["official-artwork"]["front_default"];
    }

    searchPokemon = data.id;
  } else {
    pokemonName.innerHTML = "Não encontrado :C";
    pokemonNumber.innerHTML = "";
    pokemonImage.style.display = "none";
    input.value = "";
  }
  input.value = "";
};

form.addEventListener("submit", (event) => {
  event.preventDefault();
  renderPokemon(input.value.toLowerCase());
});

buttonNext.addEventListener("click", () => {
  searchPokemon++;
  renderPokemon(searchPokemon);
});

buttonPrev.addEventListener("click", () => {
  if (searchPokemon > 1) {
    searchPokemon--;
    renderPokemon(searchPokemon);
  }
});

renderPokemon(searchPokemon);
