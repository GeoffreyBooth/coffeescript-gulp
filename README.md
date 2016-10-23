# Gulp CoffeeScript

Watch the CoffeeScript repository’s source files for changes, then recompile and test.

## Prerequisites

```sh
# Install Gulp 4 globally
npm install -g gulpjs/gulp.git#4.0
# Install CoffeeScript globally
npm install -g coffee-script
```

## Setup

Clone this repo _and_ the CoffeeScript repo (or a [fork of it](https://github.com/GeoffreyBooth/coffeescript)) as sibling folders, e.g.:

* `~/Sites/coffeescript`
* `~/Sites/coffeescript-gulp`

So something like:

```sh
mkdir -p ~/Sites
cd ~/Sites
git clone git@github.com:GeoffreyBooth/coffeescript.git
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
gulp
```

It will start and enter watch mode. Save any file in `../coffeescript/src` or `../coffeescript/test`, or `Cakefile`, to recompile the CoffeeScript compiler and run the tests. To run the tests in `node --harmony` mode, start via `gulp --test-harmony`.
