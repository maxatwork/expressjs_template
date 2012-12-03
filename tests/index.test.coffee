request = require "supertest"
app = require "#{__dirname}/../app/main"

describe 'GET /', ->
	it 'should contain text "Hello, Express!"', (done) ->
		request(app)
			.get('/')
			.expect(/Hello, Express!/, done)