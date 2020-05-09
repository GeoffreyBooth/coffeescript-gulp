gulp = require 'gulp'
util = require 'gulp-util'
execSync = require('child_process').execSync

execSyncOptions =
	cwd: "#{__dirname}/../coffeescript/"
	stdio: [process.stdin, process.stdout, process.stdin]

buildAndTest = (done, includingParser = no) ->
	try
		execSync "clear; printf '\\033[3J'", execSyncOptions
		execSync 'sync', execSyncOptions
		console.log "Recompiling#{if includingParser then ', including the parser' else ''}..."
		if includingParser
			execSync 'git checkout lib/*', execSyncOptions
			execSync 'cake build', execSyncOptions
		else
			# Don’t reset lib/coffeescript/parser.js
			execSync '''git checkout \
				lib/coffeescript/browser.js \
				lib/coffeescript/cake.js \
				lib/coffeescript/coffeescript.js \
				lib/coffeescript/command.js \
				lib/coffeescript/grammar.js \
				lib/coffeescript/helpers.js \
				lib/coffeescript/index.js \
				lib/coffeescript/lexer.js \
				lib/coffeescript/nodes.js \
				lib/coffeescript/optparse.js \
				lib/coffeescript/register.js \
				lib/coffeescript/repl.js \
				lib/coffeescript/rewriter.js \
				lib/coffeescript/scope.js \
				lib/coffeescript/sourcemap.js''', execSyncOptions
			execSync 'cake build:except-parser', execSyncOptions

		test()
	catch
	finally
		done()

clearAndTest = (done) ->
	execSync "clear; printf '\\033[3J'", Object.assign execSyncOptions, stdio: 'inherit'
	test done

test = (done) ->
	console.log 'Testing...'
	try
		execSync "node #{if util.env['test-harmony'] then '--harmony ' else ''}./bin/cake test",
			cwd: "#{__dirname}/../coffeescript/"
			stdio: [process.stdin, process.stdout, 'ignore'] # Ignore stderr, as it’s just Node warning of a nonzero exit code on test fail
	catch
	finally
		done()

watch = ->
	console.log 'Watching for changes...'
	gulp.watch ['Cakefile', 'src/*', '!src/grammar.coffee'], buildAndTest
	gulp.watch ['test/*'], clearAndTest
	gulp.watch ['src/grammar.coffee'], (done) -> buildAndTest done, yes


gulp.task 'build', buildAndTest
gulp.task 'watch', watch
gulp.task 'default', watch
