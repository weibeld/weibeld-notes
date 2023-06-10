---
created: 2023-04-04T14:02:30+02:00
edited: 2023-04-06T15:13:02+02:00
title: ISBNdb
---

## Introduction

| Name          | Value                                 |
| ------------- | ------------------------------------- |
| Website       | https://isbndb.com/                   |
| API Reference | https://isbndb.com/apidocs/v2         |
| Pricing       | Paid (starting from USD 15 per month) |

ISBNdb is a commercial book metadata database that includes more than 33 million books. Unlike [[2.box.google-books]], it is targeted solely at retrieving information and does not offer features such as managing personal collections, etc.

ISBNdb has a straightforward [API](https://isbndb.com/apidocs/v2) with endpoints for books, publishers, authors, and subjects (topics). The endpoints for publishers, authors, and subjects return a list of books that are associated with the given entity.

## Usage

### Base URL

```
https://api2.isbndb.com
```

### Authentication

An API key is required for every request which can be obtained by paying for the [subscription fee](https://isbndb.com/isbn-database).

The API key must be supplied in an `Authorization` header.

For example:

```bash
curl -H 'Authorization: xyz' <url>
```

### Response

All data is returned in JSON.

The response data structures are specified under _Models_ in the [API reference](https://isbndb.com/apidocs/v2).

### Retrieving a book by ISBN

Reference: https://isbndb.com/apidocs/v2

Endpoint:

```
/book/{isbn}
```

The `{isbn}` string must be either a 10-digit or 13-digit ISBN numbers (with or wihout dashes).

Example:

```bash
curl -H 'Authorization: xyz' 'https://api2.isbndb.com/book/9780134277554'
```

The above request returns a single book data structure for the book with the given ISBN.

> Note that the ISBN is the primary index of books in ISBNdb. ISBNdb does not assign its own IDs to books like [[2.box.google-books]] and [[2.box.open-library]].

## Discussion
