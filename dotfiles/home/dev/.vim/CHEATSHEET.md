# Vim Go IDE Cheatsheet

To view this Cheatsheet in Vim, just hit `F2`

This is written at a level that should pander to those who have very little vim experience
and still be useful to those who are far more adept at using it.

## Leader Key

The Leader key is set to `,` currently.

So when it's mentions to do Leader + action

You're actually going to hit `, then n` for reference.

You hit the keys in order, not all at once.

## Bindings

You can find all custom bindings in the vimrc

The vimrc can be accessed inside of vim via: `Leader + v`

### How to Save and Exit vim

Laugh all you want, people still don't know how to do this! :-)

* Hit `esc` then `:` and enter `q` to quit
* Hit `esc` then `:` and enter `q` to write
* Hit `esc` then `:` and enter `wq` to write and quit
* Hit `esc` then `:` and enter `q!` to quit even if there are changes

### Enable Paste Mode
Vim has a bad habit of severaly messing with pasted items with all the automformatters in place.

So to enter into paste mode, which will paste every exactly how you copied it, there is a shortcut enabled.

* Paste Mode (Toggles on and off): `Leader + p`

### Markdown Preview

* To preview Markdown File: `F7`

### NerdTree Bindings

* Open/Close or Focus on NerdTree: `Leader + n`
* Switch Between NerdTree and Editor Window
    * Horizontal Switching: `CTRL + H or L`
    * Vertical Switching: `CTRL + J or K`

### Vim-GO

#### Tagbar Toggle (Function Viewer)

* Toggle Tagbar: `F8`

#### Build/Test/Coverage Bindings

* go-run: `Leader + r`
* go-build: `Leader + b`
* go-test: `Leader + t`
* go-coverage: `Leader + c`

#### Info Bindings

* go-info: `Leader + i`

#### Interface Bindings

* go-implements: `Leader + s`

#### Godoc Bindings

* go-doc: `Leader + g + d`
* go-doc-vertical: `Leader + g + v`
