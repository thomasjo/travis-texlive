# Portable TeX Live installation

## Credit
Based on the [texlive-squashfs](https://github.com/krlmlr/texlive-squashfs) proof-of-concept created by [@krlmlr](https://github.com/krlmlr).

## What is this thing?
A simple set of tools for creating and packaging a portable TeX Live installation.
The penultimate goal as of right now, is to provide LaTeX support to Travis CI builds
of [atom-latex](https://github.com/thomasjo/atom-latex). And as such, the packaged
installation only targets x86_64-darwin.
