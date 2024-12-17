This projects demonstrates that [crane](https://crane.dev) copies the binary
created by `cargo test` into the output and not the binary created by `cargo
build`.

This can make a difference because the binary built by `cargo test` also uses
`dev-dependencies`.

```shell-session
$ nix run .#with-crane
Dev!
$ nix run .#with-nixpkgs
Not dev
```
