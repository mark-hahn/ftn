#exports.views =
#    makes:
#        map: (doc) ->
#            emit doc.make, null

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
