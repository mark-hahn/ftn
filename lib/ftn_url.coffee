###
http://ftn:5984/ftn/_design/ftn/_rewrite/?u=http://ftn:5984/wiki
    
http://ftn:5984/ftn/_design/ftn/_rewrite/?u=http://ftn:5984/wiki/455b0608d708244c51de1ef6ccc24e65
###

url = require 'url'

class FtnURL
	constructor: (urlIn) ->
		@url = (/\?u=(.*)$/i.exec(urlIn)?[1]) ? ''
		@urlParts = @url.split '/'

module.exports = new FtnURL window.location.href