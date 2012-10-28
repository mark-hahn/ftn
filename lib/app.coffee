exports.views =
    makes:
        map: (doc) ->
            emit doc.make, null

# http://localhost:5984/ftn/_design/ftn/_rewrite
# http://ftn:5984/ftn?u=http://localhost:5984
# http://ftn:5984/lib/modules.js

exports.rewrites = [
	from: 	"/ftn/_design/ftn/*"
	to: 	"*"
,
	from: 	"/*"
	to: 	"index.html"
,
	from: 	""
	to: 	"index.html"
]