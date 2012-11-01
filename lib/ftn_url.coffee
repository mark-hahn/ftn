###
    http://ftn:5984/?u=http://127.0.0.1:5984/ftn
###
    
url = require 'url'

class FtnURL
	constructor: (urlIn) ->
		@url = (/\?u=(.*)$/i.exec(urlIn)?[1]) ? ''
		@urlParts = @url.split '/'

module.exports = new FtnURL window.location.href