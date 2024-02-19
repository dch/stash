# Stash

A great place to keep your stuff.

## Installation

- install Elixir 1.15.7 or newer
- ensure you have Erlang/OTP 25 or newer
- ensure you have a local postgres server

```shell
$ git clone git@github.com:dch/stash
$ cd ./stash
$ mix setup
$ mix test --trace
$ iex --name stash -S mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
