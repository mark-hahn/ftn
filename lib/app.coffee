exports.views =
    makes:
        map: (doc) ->
            emit doc.make, null

# http://localhost:5984/feeton/_design/feeton/_rewrite

exports.rewrites = [
	"from": 	"/"
	"to": 		"lib/index.html"
	"method": 	"GET"
	"query": 	{}
]