---
created: 2023-04-04T14:02:13+02:00
edited: 2023-04-22T12:31:06+02:00
title: Google Books
---

## Introduction

| Name          | Value                                                 |
| ------------- | ----------------------------------------------------- |
| Website       | https://developers.google.com/books                   |
| API Reference | https://developers.google.com/books/docs/v1/reference |
| Pricing       | Free                                                  |

[Google Books](https://books.google.com/) is a service that provides book metadata, allows reading book previews, and also allows managing personal collections of books (see [My Library](https://books.google.com/books)). The service provides an API that allows accessing most of the features of Google Books programmatically.

For the use case of merely querying book metadata by ISBN, only a small part of the Google Books API is actually used (all the facilities for managing collections, etc. are not used and are not relevant for this use case).

> Note that in the terminology of the Google Books API, a book is called a _volume_ and a collection of books is called a _bookshelf_.

## Usage

### Base URL

```
https://www.googleapis.com/books/v1
```

### Authentication

Requests require an API key from the [Google Cloud Platform API & Services](https://console.cloud.google.com/apis/credentials) section.

The API key has to be appended as a GET parameter named `key` to the request URL.

For example:

```bash
curl <base-url>/?key=<api-key>
```

> Note that for API requests managing private bookshelves, additionally an OAuth 2.0 token is necessary. However, requests that only retrieve public book or bookshelf data only require the above-mentioned API key.

### Response

All data is returned as JSON.

The data structure for a retrieved book (volume) is specified [here](https://developers.google.com/books/docs/v1/reference/volumes#resource-representations).

### List: retrieve book by ISBN

Reference: https://developers.google.com/books/docs/v1/reference/volumes/list

Endpoint:

```
/volumes?q=isbn:{isbn}
```

In general, the above is the _list_ operation for books that returns a list of books for the provided query. The `q` parameter contains the query string. The format for the query string is specified in the [Query Parameter Reference](https://developers.google.com/books/docs/v1/using#query-params) (in general, it's similar to queries that can be entered in the Google Books search bar). Using the _list_ operation is the only way that a book can be queried by ISBN on Google Books.

Example:

```bash
curl 'https://www.googleapis.com/books/v1/volumes?q=isbn:9780134277554&key=xyz'
```

> Tip: to count the number of returned items, pipe the response to `| jq '.items | length'`.

### Get: retrieve book by Google Books ID

Reference: https://developers.google.com/books/docs/v1/reference/volumes/get

Endpoint:

```
/volumes/{volumeID}
```

The above is the _get_ operation for a book. It requires knowing the book's ID on Google Books (volume ID). The ID of a book can be found in the output of the [_list_](#retrieving-a-book-by-isbn-list) operation (see above).

Example:

```bash
curl 'https://www.googleapis.com/books/v1/volumes/qtDBjwEACAAJ?key=xyz'
```

The above example retrieves the book with ID [`qtDBjwEACAAJ`](https://books.google.ch/books?id=qtDBjwEACAAJ).

> **Important:** the data returned by the _list_ and _get_ operations for the same book (i.e. the same volume ID) often differs. The resopnse from the _get_ operation often contains more detailed (or simply different) information than the response from the _list_ operation.
