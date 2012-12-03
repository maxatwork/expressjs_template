module.exports = (grunt) ->

	grunt.loadNpmTasks 'grunt-exec'

	grunt.initConfig
		pkg: '<json:package.json>'

		exec:
			mocha:
				command: "./node_modules/.bin/mocha --require should --reporter spec --recursive --compilers coffee:coffee-script tests"
				failOnError: true
				stdout: console.log

		watch:
			files: [ './**/*.coffee', './app/views/**/*' ]
			tasks: 'default'

	grunt.registerTask 'default', 'exec:mocha'