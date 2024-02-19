.POSIX:
.PHONY: all-in-one build clean dist lint test update

all-in-one: prepare
	mix do deps.get --all, deps.compile, compile

build:
	mix compile

clean:
	rm -rf _build deps .version

dist: clean prepare
	./distribution.sh

gitup:
	@git clean -fdx
	@git fetch --force --prune --prune-tags
	@git reset --hard ${CI_REF}
	@git log --oneline HEAD -1

lint:
	# https://hexdocs.pm/dialyzex/readme.html
	# https://hexdocs.pm/credo/Credo.html
	# shows the debug info from dialyzer
	test -L ~/.mix/plts -o -d ~/.mix/plts || mkdir -p ~/.mix/plts/stash
	env MIX_DEBUG=0 mix format --check-formatted
	env MIX_DEBUG=0 mix dialyzer
	env MIX_DEBUG=0 mix credo --strict

prepare:
	mix do local.hex --force --if-missing, \
		local.rebar --force --if-missing

run:
	@env \
		iex --name stash -S mix phx.server

test:
	mix test --trace --stale --exclude browser

update:
	mix hex.outdated
	mix do deps.unlock --all, deps.update --all
	mix hex.docs fetch
