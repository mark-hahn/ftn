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

FTN is a CouchDB app. To install FTN ...

- Download the `ftn.couch` db file from this repo into your CouchDB's db folder
- Add a `vhosts` section to your db config with a key of `yourDbDomain:5984` and value of `/ftn/_design/ftn/_rewrite`.  Note that `yourDbDomain` should be your db host domain such as `ftn.org`

## Usage

Accessing your db using the domain set in your db config vhost setting will automatically perform the db request, load the request url into the FTN url builder, and show the results of the request in FTN. For example, if your db host domain was `ftn.org` then the url `http://ftn.org:5984/dbname` would perform the db info request through FTN.

If you use any other domain, such as localhost, then the request will be served as usual without FTN.  If you wish to use your normal db host domain for regular non-FTN requests, then you will need to put another domain name in your vhost setting.  One good way of doing this is to add an entry to your development computer's `hosts` file that points the domain `ftn` (just three letters) to the ip of your db host.  Then you can use the short `http://ftn:5984` to access FTN.

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
