# howoldami

A new Flutter project showing the expected age of a given name (for neon).

## Getting Started

### dev env

normally one could simply run `nix develop` to get a shell with all the necessary tools, but for some weird reason, on my machine ncurses for i686 does not build so I override the `nixpkgs` with my custom one via `nix develop --no-write-lock-file --override-input  nixpkgs /home/hannes/Repos/nixpkgs`

also the dart ffi needed for sqflite expects the `libsqlite3.so` to be in the `/usr/lib/` folder, which nix, as its not following the FHS, does not provide. so developing for linux on nix requires to enter the FHS env, via `nix run .#linuxFHS` (and then run `nix develop` in the new shell.)
