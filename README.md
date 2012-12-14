
# FTN is not under develoment at this time.

FTN
=========

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

FTN is a CouchDB app. To install FTN just download the `ftn.couch` db file from the FTN github download page into your CouchDB's db folder.

## Usage

The app can be run by going to `http://domain:5984/ftn/_design/ftn/index.html`.

You can also directly access an arbitrary couch db url and show it in FTN.  For example, if you want to see a document with an id of `id` in db `db` then you would use this url ...

    http://domain:5984/ftn/_design/ftn/index.html?u=/db/id

## Try It Out

There is a version of FTN running on iriscouch.  There is the FTN db and a sample db of wikipedia entries.  Try it [here](https://mark-hahn.iriscouch.com:6984/ftn/_design/ftn/index.html?u=/wiki/455b0608d708244c51de1ef6ccc24e65).  To see the wikipedia text click on the expand-all icon in the editor and scroll to the bottom.

At the time of this writing FTN only accesses the db and displays it in a json editor.

## FTN Technology

FTN is a CouchDB app using BackBone, written in CoffeeScript, and built with Kanso.

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

## Credits

The excellent json editor is by Jos de Jong.  You can find it on [github](https://github.com/wjosdejong/jsoneditoronline).

## License

Standard MIT license.  See the `LICENSE` file.
