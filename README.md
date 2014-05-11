# Portable TeX Live installation for Travis CI

## Credit
Based on @krlmlr's [texlive-squashfs repo](https://github.com/krlmlr/texlive-squashfs).

## What is this thing?
A simple set of tools for creating, and packaging, a portable TeX Live installation.
The penultimate goal as of right now, is to provide LaTeX support to Travis CI builds
of [atom-latex](https://github.com/thomasjo/atom-latex). And as such, the packaged
installation only targets x86_64-darwin.
