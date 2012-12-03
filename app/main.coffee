routes = require './routes'
app = module.exports = require './config'

# Routes

app.get '/', routes.index