# rjbs's Vim Configuration

## .vimrc

My [`.vimrc`](.vimrc) is pretty basic.  It's mostly normal Vim settings, with
just a few custom functions.  It's meant to work on its own with none of my
usual plugins.

## manxome.vim

My Vim color scheme, [`manxome.vim`](.vim/colors/manxome.vim), has been
virtually unchanged since 2002, or maybe earlier.  It's very much "blues and
whites", with some other colors for accent.  I still find it more pleasant than
any other terminal editing color scheme I've tried.

There's an after-syntax plugin to add a few syntax groups to Perl.

## Other personal configuration

The after-ftplugin plugin for Perl fixes a couple things I really need fixed.
Most importantly, it removes `:` from `iskeyword`, meaning that "word" objects
break at package part boundaries.

## Plugins

Honestly, this README file is mostly here so I can write down which plugins I
have installed, and why, and so I can look at something that reminds me what's
what.

* [abolish](https://github.com/tpope/vim-abolish.git) is to help eliminate
  common typos.  Basically it's a smart `:abbr`-creator.  I have it autocorrect
  "independance" to "independence", for example.

* [airline](https://github.com/bling/vim-airline) and
  [airline-themes](https://github.com/vim-airline/vim-airline-themes/) provide
  a better status line.  I probably only use 5% of what it they offer.

* [commentary](https://github.com/tpope/vim-commentary) adds the `gc` action to
  comment out text, supporting many file types.  `gcc` does the current line,
  but it also supports visual mode and the usual text objects.

* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Ctrl-P brings up a fuzzy
  file finder.  Some day I will try the other fuzzy file finders.  This one has
  been very good for me for ages.

* [expand-region](https://github.com/terryma/vim-expand-region) adds a means to
  grow or shrink the visual selection.  For me, tap `v` to grow and `C-v` to
  shrink the selection.

* [extradite](https://github.com/int3/vim-extradite) is meant to extend
  Fugitive.  Honestly, I can't see what it's doing for me at the moment.

* [fugitive](https://github.com/tpope/vim-fugitive) is *the* Git plugin for
  Vim.  I know it does a lot, but I almost entirely use it for `:Git blame`,
  and sometimes `:Gread`, which basically replaces the buffer with the
  committed version of the file being edited.

* [json](https://github.com/elzr/vim-json) is just slightly better JSON
  editing.  It has concealment (which I don't think I'd ever use).  I think I
  use it for a bit better syntax highlighting?

* [perl](https://github.com/vim-perl/vim-perl) is the Perl plugin for Vim.
  It's how you get more up-to-date syntax highlighting.  Make sure you track
  the `dev` branch, because `master` is never updated.  I bet I rely on it for
  other stuff, but I don't know what.

* [repeat](https://github.com/tpope/vim-repeat) lets plugins teach `.` to
  repeat their whole action, not just the last command in a map.  I don't use
  this directly, but it makes other stuff better (specifically `surround` and
  `unimpaired`).

* [rust.vim](https://github.com/rust-lang/rust.vim) is helpers for Rust.  I
  think I installed it mostly for syntax.  For a long while I disabled the way
  it configured the editor to match Rust standard style, but I gave up on that.

* [surround](https://github.com/tpope/vim-surround) adds mappings to futzing
  with things that surround text.  I never use this, but I should.  Examples:
  `cs'"` changes the surrounding single quotes to double quotes.  `ds{` will
  delete surrounding braces.

* [tabular](https://github.com/godlygeek/tabular) provides `:Tabularize` for
  aligning text on a delimiter.  I almost only ever use it by selecting a few
  lines and then doing `:'<,'>Tabular /=>` to pairs in Perl on the fat arrows.

* [textobj-entire](https://github.com/kana/vim-textobj-entire) and
  [textobj-line](https://github.com/kana/vim-textobj-line) add new text
  objects for "the whole file" and "the current line".  Those are `ae` and `ie`
  (for the file) and `al` and `il` (for the line).  There are two for each,
  because there are more and less expansive, like `aw` and `iw` for words.
  Both of these plugins rely on
  [textobj-user](https://github.com/kana/vim-textobj-user).

* [toml](https://github.com/cespare/vim-toml) is just Vim support for TOML.  I
  think I have this entirely for the syntax highlighting.

* [unimpaired](https://github.com/tpope/vim-unimpaired) is… well, look, it's
  that plugin that everybody says "oh, you *really* should install and use
  unimpaired!".  It sets up a bunch of mappings that are pitched as "the
  mappings that obviously should've been there from the start."  They seem
  pretty good, but I've never learned them.  But maybe I will someday.  Maybe.
  Anyway, I'm not uninstalling this.
