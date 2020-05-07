# Gulp CoffeeScript

Watch the CoffeeScript repository’s source files for changes, then recompile and test.

## Prerequisites

It is assumed the `git` command is available globally. You also need the `cake` command available globally, so install CoffeeScript (the official published version) globally if you haven’t already done so:

```sh
# Install CoffeeScript globally
npm install --global coffeescript
```

## Setup

Clone this repo _and_ the CoffeeScript repo (or a [fork of it](https://github.com/GeoffreyBooth/coffeescript)) as sibling folders, e.g.:

* `~/Sites/coffeescript`
* `~/Sites/coffeescript-gulp`

So something like:

```sh
mkdir -p ~/Sites
cd ~/Sites
git clone git@github.com:jashkenas/coffeescript.git
git clone git@github.com:GeoffreyBooth/coffeescript-gulp.git
```

Next, within the `coffeescript-gulp` repo, create symlinks to the CoffeeScript repo’s src and test folders:

```sh
cd ~/Sites/coffeescript-gulp
ln -s ../coffeescript/Cakefile Cakefile
ln -s ../coffeescript/src src
ln -s ../coffeescript/test test
```

# Run

```sh
cd ~/Sites/coffeescript-gulp
npx gulp
```

It will start and enter watch mode. Save any file in `../coffeescript/src` or `../coffeescript/test`, or `Cakefile`, to recompile the CoffeeScript compiler and run the tests. To run the tests in `node --harmony` mode, start via `gulp --test-harmony`.
