{ pkgs ? import <nixpkgs> {} }:

let
  cargoToml = pkgs.lib.importTOML ./Cargo.toml;
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = cargoToml.package.name;
  version = cargoToml.package.version;

  src = pkgs.lib.cleanSource ./.;

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  meta = {
    description = "An mdBook preprocessor that generates a full-content RSS/Atom feed from your book";
    homepage = "https://github.com/saylesss88/mdbook-rss-feed";
    license = pkgs.lib.licenses.asl20;
    maintainers = with pkgs.lib.maintainers; [ ];
    mainProgram = "mdbook-rss-feed";
  };
}
