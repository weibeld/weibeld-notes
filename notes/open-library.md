---
created: 2023-04-04T14:02:55+02:00
edited: 2023-04-06T15:30:15+02:00
title: Open Library
---

## Introduction

| Name          | Value                                          |
| ------------- | ---------------------------------------------- |
| Website       | https://openlibrary.org/                       |
| GitHub        | https://github.com/internetarchive/openlibrary |
| API Reference | https://openlibrary.org/developers/api         |
| Pricing       | Free                                           |

Open Library is an open-source project with a similar scope as [Google Books](http://books.google.com/), that is, beyond simple book metadata, it also offers reading lists, collections, etc.

The [Open Library API](https://openlibrary.org/developers/api) seems to not fully cover the Open Library features set (e.g. it doesn't allow manipulating reading lists), however, it provides everything that's needed for querying book metadata.

The API provides endpoints for [works](https://openlibrary.org/dev/docs/api/books) (the set of all editions of a specific book), [editions](https://openlibrary.org/dev/docs/api/books) (a specific book with its own ISBN), [authors](https://openlibrary.org/dev/docs/api/authors) (allows retrieving all the editions, i.e. books, of an author), and [subjects](https://openlibrary.org/dev/docs/api/subjects) (includes all the works related to a subject).

The API also provides a [search](https://openlibrary.org/dev/docs/api/search) endpoint for discovering books by matching a search term against metadata field, and a dedicated [ISBN](https://openlibrary.org/dev/docs/api/books) endpoint which allows querying an edition given the books ISBN (in fact, this endpoint automatically forwards to the corresponding edition endpoint).

## Usage

### Base URL

```
https://openlibrary.org
```

### Authentication

None required.

### Response

All data can be returned as either JSON, YAML, or RDF. The format can be chosen by using either `.json`, `.yml`, or `.rdf` as the suffix for the request URLs (see below).

The structure of the returned objects seems to not be consistently documented anywhere.

### Retrieving a book by ISBN

Reference: https://openlibrary.org/dev/docs/api/books

Endpoint:

```
/isbn/{isbn}
```

In the above specification, `{isbn}` is the 10 or 13-digit ISBN of the desired book (with or without dashes).

Note that this endpoint automatically redirects to the corresponding edition endpoint:

```
/book/{id}
```

In the above specification, `{id}` is the Open Library ID for this specific edition (i.e. book).

Example:

```bash
curl -L 'https://openlibrary.org/isbn/9780134277554.json'
```

Note that the `-L` flag is necessary because the above endpoint redirects to the corresponding editions endpoint for the book matching the provided ISBN, as mentioned above.

In this example, the ID of this book happens to be `OL32250696M`, thus the above request is equivalent to the following:

```bash
curl https://openlibrary.org/books/OL32250696M.json
```
