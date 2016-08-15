gulp = require 'gulp'
exec = require('child_process').exec

build = (done) ->
	console.log 'Recompiling...'
	exec "clear; printf '\\033[3J'; cd #{__dirname}/../coffeescript/ && git checkout lib/* && cake build && cake build:parser && cake test", (err, stdout, stderr) ->
		console.log stdout
		console.error stderr
		done err

watch = ->
	console.log 'Watching for changes...'
	gulp.watch ['src/*', 'test/*'], build

gulp.task 'build', build
gulp.task 'watch', watch
gulp.task 'default', watch
