gulp = require 'gulp'
exec = require('child_process').exec

build = (done, includingParser = no) ->
	console.log "Recompiling#{if includingParser then ', including the parser' else ''}..."
	exec "clear; printf '\\033[3J'; cd #{__dirname}/../coffeescript/ && git checkout lib/* && cake build #{if includingParser then '&& cake build:parser' else ''} && npm run test-harmony", (err, stdout, stderr) ->
		console.log stdout
		console.error stderr
		done err

watch = ->
	console.log 'Watching for changes...'
	gulp.watch ['Cakefile', 'src/*', 'test/*', '!src/grammar.coffee'], build
	gulp.watch ['src/grammar.coffee'], (done) -> build done, yes

gulp.task 'build', build
gulp.task 'watch', watch
gulp.task 'default', watch
