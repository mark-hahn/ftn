# FTN
Advanced replacement for CouchDB's Futon admin utility.

The FTN github project can be found [here](https://github.com/mark-hahn/ftn).

## Status:

FTN is currently in design (pre-alpha) and should be ready to try out by the end of the year (2012) at the latest.

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
 
## Installation

FTN is a CouchDB app. To install FTN just download the `ftn.couch` db file from this repo into your CouchDB's db folder.  Then it can be accessed at http://domain:5984/ftn/_design/ftn/_rewrite.  (See usage section for explanation of why rewrite cannot be used).

## Usage

Unfortunately ftn currently requires a long url to access an arbitrary couch db url.  For example, if you want to see a document with an id of `id` in db `db` then you would need to use this url ...

    http://domain:5984/ftn/_design/ftn/_rewrite/?u=http://domain:5984/db/id

I am investigating how to use a vhost and rewrite to get a short url, but so far it seems impossible since the ajax calls from ftn would not be able to access a different db than ftn.

## FTN Technology

FTN is a CouchDB/BackBone app written in CoffeeScript and built with Kanso.

## Preparing A Development Environment

If you are such a wonderful person that you want to help out with FTN and compile the design doc, then follow these steps...

- Install kanso (http://kan.so)
- Install coffeescript (npm i -g coffee-script)
- Create couch db called "ftn"
- Clone this repo
- Change to new ftn directory
- Create file .kansorc to point to the ftn db
- kanso install
- kanso push

Pull requests are welcome.

## License

Standard MIT license.  See the `LICENSE` file.
