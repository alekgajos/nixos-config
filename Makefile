.PHONY: update
update:
	home-manager switch --flake .#default-profile

.PHONY: clean
clean:
	nix-collect-garbage -d
