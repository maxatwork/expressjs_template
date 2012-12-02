###
Module dependencies.
###

express = require 'express'
routes = require './routes'

app = module.exports = express.createServer();

# Configuration

app.configure ->
	app.set "views", "#{__dirname}/views"
	app.set 'view engine', 'jade'
	app.set 'view options', { layout: false }

	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use app.router

	publicDir = "#{__dirname}/public"
	assetsDir = "#{__dirname}/assets"

	app.use require('connect-assets') { src: assetsDir }
	app.use express.static(publicDir)
	return


app.configure 'development', ->
	app.use express.errorHandler { dumpExceptions: true, showStack: true }
	return


app.configure 'production', ->
	app.use express.errorHandler()
	return


# Routes

app.get '/', routes.index

app.listen 43313, ->
	console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env
	return