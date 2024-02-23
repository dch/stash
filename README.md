# Stash

A great place to keep your stuff.

## Installation

- install Elixir 1.15.7 or newer
- ensure you have Erlang/OTP 25 or newer
- ensure you have a local postgres server
- install tailwind via npm if you are on FreeBSD

```shell
$ git clone git@github.com:dch/stash
$ cd ./stash
$ test $(uname -s) = FreeBSD && \
    npm install --prefix assets -D tailwindcss@latest postcss@latest autoprefixer@latest @tailwindcss/forms
$ mkdir _build
$ ln -s ../assets/node_modules/.bin/tailwindcss/tailwind _build/tailwind-freebsd-(uname -m)
$ mix do setup, assets.deploy
$ mix test --trace
$ iex --name stash -S mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
