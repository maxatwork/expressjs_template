app = require './app/main'

app.listen 43313, ->
	console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env
	return