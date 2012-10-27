exports.views =
    makes:
        map: (doc) ->
            emit doc.make, null

# http://localhost:5984/ftn/_design/ftn/_rewrite

exports.rewrites = [
	"from": 	"/"
	"to": 		"lib/index.html"
	"method": 	"*"
	"query": 	{}
]