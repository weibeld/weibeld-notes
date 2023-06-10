---
created: 2023-03-18T01:54:08+01:00
edited: 2023-03-18T01:55:08+01:00
title: LDAP and OpenLDAP
---

Some miscellaneous information about LDAP in general, and the OpenLDAP implementation.

* * *

The schemas of the object classes are defined in `/etc/ldap/schema`.

`top` is the root object class that all other object classes inherit from. It defines the `objectClass` attribute [to be mandatory](https://www.zytrax.com/books/ldap/ch3/#objectclasses) (its schema is not in `/etc/ldap/schema`).

Schema hierarchy for the `inetOrgPerson` object class:

```
top -> person -> organizationalPerson -> inetOrgPerson
```

Note: add `uidObject` objectClass to the user entry, which makes the `uid` attribute mandatory. As the main object class, use `person`, `organizationalPerson`, or `inetOrgPerson`.

> An entry must have all those attributes that are _required_ in the schemas of all its object classes, and can have at most those attributes that are _required_ and _optional_ in the schemas of all its object classes (i.e. an entry must not have any attribute that is not defined in the schema of any of its object classes).

When installing OpenLDAP with `apt-get` on a GCP compute instance, there is a default database with a suffix of `dc=c,dc=resonant-grail-262306,dc=internal` (named after the GCP project) (the database is defined in `/etc/ldap/slapd.d/cn=config/olcDatabase={1}mdb.ldif`). This means that every entry must be under this suffix, which 1) is not predictable, and 2) is long to type.

Thus, is it easily possible to change this suffix or create a new database with a suffix such as `dc=learnk8s,dc=io`?

**Questions:**

- How many databases are there usually in an LDAP server?
    - Seems to be usually one, but it's possible to create new ones.
- How to create a new database?
    - [Creating second database/domain in OpenLDAP](https://stackoverflow.com/questions/30898397/creating-second-database-domain-in-openldap)
    - [Multiple rootdn on one ldap server](https://serverfault.com/questions/262137/multiple-rootdn-on-one-ldap-server)
- How to change the suffix of a database?
    - [Changing the DN of an OpenLDAP server](https://www.openldap.org/lists/openldap-technical/201007/msg00231.html)
    - [If you want to acess](https://serverfault.com/questions/881274/when-is-ldapi-y-external-needed-apparently-cosine-ldif-breaks-without-it) `cn=config`, you have to use `-H ldapi:/// -Y EXTERNAL` and drop `-x -w password -D '...'`
    - [LDAPI stands for "LDAP over IPC Mechanisms"](https://ldapwiki.com/wiki/Using%20LDAP%20over%20IPC%20Mechanisms). Can be used if client and server are on the same host and uses some other IPC mechanism rather than TCP/IP. Can also implicitly provide the client's identity to the server for extremely lightweight authentication.
- How to change the access control to a database (disable authentication for both reads and writes)?
    - Modify the `olcAccess` attributes in the `olcDatabaseConfig` entry in `olcDatabase={1}mdb.ldif` in the same way as they are modified for changing the suffix.
    - The default access does not require authentication for read operations (anonymous access). Thus, you can read items with `ldapsearch -x -b '<base>'`
- How to specify a specific database in commands like ldapsearch and ldapmodify?
    - You don't have to specify a database, you just specify a DN that you want to access (in the search base). Each DN uniquely maps to a database, since each database has a distinct suffix.
