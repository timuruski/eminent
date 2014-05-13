Eminent
=======

> As in domain

A tiny program for working with domains. May or may not gain a web
interface when it grows up.

## Usage

Eminent requires two data files in the form of YAML.

There is a file to track all the domains and where they are registered:

    # data/domains.yml
    ---
    example.com:
      created_on: 2014-01-01
      expires_on: 2015-01-01
      registrar: name.com
    zerozero.co:
      created_on: 2013-05-31
      expires_on: 2017-05-31
      registrar: name.com

There is a file to track registrars and the price per TLD.

    # data/registrars.yml
    name.com:
      name: Name.com
      tlds:
        com: 10.99
        net: 10.99
        co: 18.99
    gandi.net:
      name: Gandi
      tlds:
        com: 10.99
        net: 10.99
