# Feeton
Advanced replacement for CouchDB's Futon admin utility.

The Feeton github project can be found [here](https://github.com/mark-hahn/Feeton).

## Status:

Feeton is currently in design (pre-alpha) and should be ready to try out by the end of the year (2012) at the latest.

## Features
 
- Web-based like Futon
- One-page responsive app
- Tabbed interface with history
- URL builder allows direct access to REST api
- Easy-to-use custom views with joins
- Doc filtering including simple view key ranges
- Hovering over any ID shows short doc view
- Hovering over any numeric time shows readable time/date
- Clicking on any doc id opens doc
- Live data updates using changes feed
- Views with very large results supported without pagination
- Cached in local browser-based indexedDB
 
## Installation:

Feeton is a CouchDB app.  To install Feeton just copy the feeton.db file into your CouchDB's DB folder and access it with http://your-domain.com:5984/feeton/app/index.html.

## Feeton Technology

Feeton is a CouchDB/BackBone app written in CoffeeScript and built with Kanso.

## Feeton Test Site

A development environment and public test site will be available soon thanks to site hosting contributed by [WebFaction](http://www.webfaction.com).  

## License

Standard MIT license.  See the `FEETON-LICENSE` file.
