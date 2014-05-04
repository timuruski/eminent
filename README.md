Eminent
=======

> As in domain

A tiny program for working with domains. May or may not gain a web
interface when it grows up.

## Usage

Working with registrars:

    $ em registrar add namecheap --hostname https://namecheap.com
    $ em registrar add-price namecheap com 10.99


Adding and updating domains:

    $ em domain add example.com --registrar namecheap
    $ em domain update example.com --expiry 2015-01-01


Working with domains:

    $ em list
    $ em list namecheap
    $ em expiring
    $ em total

