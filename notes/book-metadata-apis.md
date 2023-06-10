---
created: 2023-04-04T13:52:44+02:00
edited: 2023-04-23T12:50:21+02:00
title: Book Metadata APIs
---

## Introduction

These are APIs that provide metadata about published books, such as the title, subtitle, edition, authors, publisher, publication date, number of pages, cover images, and ISBN of a book.

## Existing APIs

The following seem to be the most important services that provide an API for querying book metadata:

- [[2.box.google-books]]
- [[2.box.isbndb]]
- [[2.box.open-library]]

> The above links contain detailed usage information for the corresponding APIs.

## Comparative analysis

The following is an empirical, non-representative analysis of the quality of metadata returned by the above three services. The data is based on a sample set of 180 books that have been queried by ISBN through the corresponding APIs.

> Note: the Google Books API returns two different data sets for a given book depending on whether the _list_ or _get_ operation is used (see [[2.box.google-books]]). Therefore, these two operations are treated separately below and labelled with either _list_ or _get_, where applicable.

### Completeness

Number of found and missed books (queried by ISBN) of the 180 sample books:

| API                           | Found | Not found | Not found (%) |
| ----------------------------- | ----- | --------- | ------------- |
| Google Books _list_ and _get_ | 166   | 14        | 7.7%          |
| ISBNdb                        | 176   | 4         | 2.2%          |
| Open Library                  | 174   | 6         | 3.3%          |

Observations:

- ISBNdb finds almost all books by ISBN. The only books that it didn't find where open-source and free books (e.g. O'Reilly compliments), which also aren't sold on Amazon.
- Open Library does not find the same books as ISBNdb plus very few other books.
- Google Books does not find the same books as ISBNdb plus a considerable number of other books.
    - Note that for retrieving books by ISBN, only the _list_ operation of Google Books can be used (the _get_ operation requires knowing the Google Books ID of the book).

> Note that some of the percentages reported below are relative to the found number of books of the corresponding API (i.e. the number in the _Found_ column in the table above).

### Title/subtitle

Kind of title and subtitle metadata returned by the different APIs:

| API                 | Title | Subtitle |
| ------------------- | ----- | -------- |
| Google Books _list_ | ✅     | ✅        |
| Google Books _get_  | ✅     | ✅        |
| ISBNdb              | ✅     | ❌        |
| Open Library        | ✅     | ✅        |

Observations:

- Google Books returns both title and subtitle and generally assigns them in a sensible way to these two fields.
    - In rare cases, a string that should be part of the title is assigned to the subtitle field, which may make the title very short.
- Open Library also distinguishes between title and subtitle, however, often the book's subtitle is assigned to the title field and the subtitle field is left empty. This makes the title field too long.
- ISBNdb only has a title field which generally includes both the title and subtitle. This makes the title field too long.
- In general, the quality of the title/subtitle data is: Google Books > Open Library > ISBNdb

### Edition

Number of books with missing edition metadata:

| API                 | Missing | Missing (%) |
| ------------------- | ------- | ----------- |
| Google Books _list_ | N/A     | N/A         |
| Google Books _get_  | N/A     | N/A         |
| ISBNdb              | 18      | 10.2%       |
| Open Library        | 130     | 74.7%       |

> Note that percentages are relative to the number of actually found books (see [Success rate](#success-rate) above).

Observations:

- Google Books does not report any edition data at all (both _list_ and _get_)
- ISBNdb reports an edition for most books
- Open Library does not report an edition for the majority of books
- For the books that both ISBNdb and Open Library report an edition, the editions usually coincide
- In all cases, the edition is returned as a string and the formatting is not consistent within and across the APIs (e.g. may be "2", "2nd", "Second", etc.).

### Publisher

Number of books with missing publisher metadata:

| API                 | Missing | Missing (%) |
| ------------------- | ------- | ----------- |
| Google Books _list_ | 24      | 14.4%       |
| Google Books _get_  | 0       | 0%          |
| ISBNdb              | 1       | 0.5%        |
| Open Library        | 4       | 2.2%        |

Observations:

- Google Books _list_ misses publisher data for many books. These are mostly "normal" (i.e. not obscure) books.
- Google Books _get_ has publisher data for all books.
- For Google Books and Open Library, the returned publisher strings are internally very inconsistent, that is, there are many different versions of how, for example, O'Reilly and Manning is spelled.
- For ISBNdb the publisher strings are almost consistent (with very few exceptions)

### Authors

Number of books with missing author data:

| API                 | Missing | Missing (%) |
| ------------------- | ------- | ----------- |
| Google Books _list_ | 0       | 0%          |
| Google Books _get_  | 1       | 0.6%        |
| ISBNdb              | 0       | 0%          |
| Open Library        | 38      | 21.8%       |

Observations:

- Google Books and ISBNdb include author data for all books
    - Google Books _get_ misses the author for one book (LaTeX Companion)
- Open Library misses author data for many books
    - However, besides the 38 books with no authors field, there are 15 books with a contributors field. These partly overlap with the books with no authors field, and in these cases, the authors are most probably reported in the contributors field instead of the authors field. However, other books contain both an authors and contributors field with different people in each.
- In Google Books and Open Library, author strings are formatted as `<first> [<middle>] <last>`, whereas in ISBNdb they are formatted as `<last>, <first> [<middle>]`.

### Publication date

Number of books with missing publication date:

| API                 | Missing | Missing (%) | Format            |
| ------------------- | ------- | ----------- | ----------------- |
| Google Books _list_ | 35      | 21%         | Year or full date |
| Google Books _get_  | 0       | 0%          | Year or full date |
| ISBNdb              | 2       | 1.1%        | Year              |
| Open Library        | 0       | 0%          | Year or full date |

> Note that percentages are relative to the number of actually found books (see [Success rate](#success-rate) above).

Observations:

- In most cases, the reported years coincide or are off by one year.
- In some cases, the reported year of one API is off by more than one, which is most probably an error.
- In all cases, the date is returned as a string (even if it's just the year).
- If the date is reported as a full date, the format is not consistent within the same API.
- The data returned by Google Books _get_ and _list_ differs for 25 books
    - For most of these differing books, the year is the same (e.g. one operation reports only year and the other hte full date)
    - For some few books the years differ too. In these cases, both versions may contain the correct value.


### Pages

Number of books with missing page metadata:

| API                 | Missing | Missing (%) |
| ------------------- | ------- | ----------- |
| Google Books _list_ | 35      | 13.8%       |
| Google Books _get_  | 0       | 0%          |
| ISBNdb              | 2       | 1.1%        |
| Open Library        | 35      | 13.8%       |

Observations:

- The set of books with missing page metadata differs between Google Books and Open Library
    - There's no clear pattern as to for what books the page metadata is missing
- The reported number of pages for a given book may differ between the different APIs: ometimes all three APIs report a different value, soemtimes two of them have the same value, and sometimes they all have the same value.
    - If the numbers differ, they mostly differ only slightly (i.e. less than 10%), however, occasionally, they may differ more.
- The values reported by Google Books _list_ and _get_ differ in most cases. In most of these cases, they differ only slightly (e.g. less than 10%), however, in some cases they differ significantly. In this case, the values of Google Books _get_ seem more accurate.

### Covers

Number of books with missing cover images:

| API                 | Missing | Missing (%) |
| ------------------- | ------- | ----------- |
| Google Books _list_ | 9       | 5.4%        |
| Google Books _get_  | 0       | 0%          |
| ISBNdb              | 0       | 0%          |
| Open Library        | 28      | 16%         |

Observations:

- ISBNdb has covers for all books but the quality is not very high. The width of the images varies from 100 to 400px. There are also some non-JPG and invalid files included.
- Google Books _list_ only provides thumbnails with a width of 128px.
- Google Books _get_ provides large covers (width of 800px) for about 60 books, however, in most cases it's not the cover but the title page within the book, etc.
- Open Library  doesn't have covers for a considerable amount of books, however, the covers that it has are of quite good quality.
    - In general, Open Library provides covers in three sizes: S (width 30-50px), M (width 180px), and L (width 300-500px).

## Suitability matrix

The following table gives an overview about which service is best (or worst) for each specific type of metadata:

|                  | Google Books _(list)_ | ISBNdb | Open Library |
| ---------------- | --------------------- | ------ | ------------ |
| Title/subtitle   | 1                     | 3      | 2            |
| Edition          | 3                     | 1      | 2            |
| Authors          | 1                     | 1      | 2            |
| Publisher        | 3                     | 1      | 2            |
| Publication date | 2                     | 1      | 1            |
| Pages            | 2                     | 1      | 2            |
| Cover            | 3                     | 2      | 1            |
