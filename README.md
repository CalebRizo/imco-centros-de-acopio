# IMCO Centros de acopio

IMCO's idea to find the nearest gathering center to better help those in need and for better resources distribution.

## About

Taking in account the past aerthquak and with the aim to help thos whom need it, this projects propose a tool to solve the problems eith the lack of efficenci in the distribuitoin of the resoirces collected by the recollecting centers.

The idea is a map where the refuges can find the nearest recolecting spot to them.

You can find the demo clinking [here]

## Stack

* powered by [elixir] with [Phoenix] as the backend
* And [React] for the fronten.
* Uses also Google Maps API

Though for the quick development it also uses phoenix templates combined with somo JQuery.

## Run instructions

You need o have installed elixir in your  machine

To start your Phoenix server:

```bash
# Install dependencies with
mixdeps.get

# Create and migrate your database with
mix ecto.setup

# Then you need to prepare React App
cd asstes

# Install dependencies (you could use yarn if prefered)
npm install

# Change again to roots project directory
cd ..

# and Start Phoenix server with
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Run & Build instructions

``` bash
# Go to code directory
cd code

# Install dependencies (you could use yarn if prefered)
npm install

# Run project in dev mode
npm run dev:start

# To build the project
npm run build
```

Crafted with ❤ in Mexico.

[here]: https://imco-centros-de-acopio.gigalixirapp.com
[elixir]: https://elixir-lang.org/
[Phoenix]: http://phoenixframework.org/
[React]: https://reactjs.org/
