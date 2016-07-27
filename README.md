# Gulp CoffeeScript

Watch the CoffeeScript repository’s source files for changes, then recompile and test.

## Quickstart

```sh
# Install Gulp 4 globally
npm install -g gulpjs/gulp.git#4.0
# Install CoffeeScript globally
npm install -g coffee-script

# Create symlinks to the CoffeeScript repo’s src and test folders
ln -s ../coffeescript/src src
ln -s ../coffeescript/test test

# Run
gulp