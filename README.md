# IMCO Centros de acopio

IMCO's idea to find the nearest gathering center to better help those in need and for better resources distribution.

## About

Taking in account the last year earthquake, and the more recent ones, with the aim to help thos whom need it, this projects propose a interactive map to solve the problems with the lack of efficience in the distribuitoin of the collected resources.

This is an intercative map where the refuges can find the nearest recolecting spot to them.

You can find the demo clinking [here]

## Stack

* Backend: Powered by [elixir] with [Phoenix].
* Frontend: Made with [React].
* Uses also Google Maps API.
* It is hosted in [Gigalixir].

Though for the quick development it also uses phoenix templates combined with some JQuery.

## Run instructions

You need to have installed elixir [here the instrucions], and npm too.

To start your Phoenix server:

```bash
#Clone this repo to your local
git clone https://github.com/CalebRizo/imco-centros-de-acopio.git

# Change to imco-centros-de-acopio directory
cd imco-centros-de-acopio

# Install dependencies with
mixdeps.get

# Create and migrate your database with
mix ecto.setup

# Then you need to prepare React App
# Change to assets directory
cd asstes

# Install dependencies (you could use yarn if prefered)
npm install

# Change again to roots project directory
cd ..

# and Start Phoenix server with
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Crafted with ❤ in Mexico.

[here]: https://imco-centros-de-acopio.gigalixirapp.com
[elixir]: https://elixir-lang.org/
[Phoenix]: http://phoenixframework.org/
[React]: https://reactjs.org/
[Gigalixir]: https://gigalixir.com/
[here the instrucions]: https://elixir-lang.org/getting-started/introduction.html#installation
