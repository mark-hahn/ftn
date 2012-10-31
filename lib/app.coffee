#exports.views =
#    makes:
#        map: (doc) ->
#            emit doc.make, null

exports.rewrites = [
	from: 	"modules.js"
	to: 	"modules.js"
,
	from: 	"jsoneditor/*"
	to: 	"jsoneditor/*"
,
	from: 	"/*"
	to: 	"index.html"
,
	from: 	""
	to: 	"index.html"
]
