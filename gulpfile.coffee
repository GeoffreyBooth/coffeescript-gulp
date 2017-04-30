gulp = require 'gulp'
util = require 'gulp-util'
execSync = require('child_process').execSync

build = (done, includingParser = no) ->
	try
		execSync "clear; printf '\\033[3J'; echo 'Recompiling#{if includingParser then ', including the parser' else ''}...'; cd #{__dirname}/../coffeescript/ && git checkout lib/* && cake build#{unless includingParser then ':except-parser' else ''} && echo 'Testing...' && node #{if util.env['test-harmony'] then '--harmony ' else ''} ./bin/cake test", stdio: [process.stdin, process.stdout, 'ignore'] # Ignore stderr, as it’s just Node warning of a nonzero exit code on test fail
		done()
	catch exception
		done()

watch = ->
	console.log 'Watching for changes...'
	gulp.watch ['Cakefile', 'src/*', 'test/*', '!src/grammar.coffee'], build
	gulp.watch ['src/grammar.coffee'], (done) -> build done, yes

gulp.task 'build', build
gulp.task 'watch', watch
gulp.task 'default', watch
