---
created: 2024-05-03T12:27:21+02:00
edited: 2024-05-03T12:27:21+02:00
title: Locales
---

## What is a locale?

A locale defines language and region-specific characteristics for aspects like the order of characters, time and date formats, and the formatting of numeric and monetary strings.

The desired locale for different of these aspects can be assigned to a set of locale environment variables (most of them starting with `LC_*`).

## What locale environment variables exist?

The set of available locale environment variables and their current values can be displayed with the following command:

```bash
$ locale
```

> **Note:** the semantics of these environment variables are explained in the `locale` man page.

## What locales exist?

The full list of supported locales can be displayed with:

```bash
$ locale -a | sort
```

> **Note:** the data backing these locales can be found in `/usr/share/locale`.

## What do locales define?

The assignment of a locale to a local environment variable results in the assignment of _values_ to a specific set of _keywords_ (think, configuration settings).

These keywords are organised into 6 _categories_. These categories can be listed with the following command:

```bash
$ locale LC_SPECIAL
LC_COLLATE LC_CTYPE LC_MESSAGES LC_MONETARY LC_NUMERIC LC_TIME
```

> **Note:** as can be seen, these categories correspond to the locale environment variables (see [_What locale environment variables exist?_](#what-locale-environment-variables-exist)).

The keywords (including their current values) belonging to a specific category can be listed as follows:

```bash
$ locale -k <CATEGORY>
```

For example:

```bash
$ locale -k LC_NUMERIC
```

Listing the keywords of all categories at once can be done as follows:

```bash
$ locale -kc $(locale LC_SPECIAL)
```

A locale defines values for all of these keywords. When a locale is assigned to a specific category (by assigning the locale to the corresponding environment variable), then the locale's values are assigned to the corresponding keywords of this category.

For example, assign the `en_US.UTF-8` locale to the `LC_NUMERIC` category and print the keywords:

```bash
$ export LC_NUMERIC=en_US.UTF-8
$ locale -k LC_NUMERIC
decimal_point="."
thousands_sep=","
grouping="3;3"
```

Then, assign the `de_CH.UTF-8` locale to the `LC_NUMERIC` category and print the keywords again:

```bash
$ export LC_NUMERIC=de_CH.UTF-8
$ locale -k LC_NUMERIC
decimal_point=","
thousands_sep=""
grouping="127"
```

As can be seen, the values of the keywords changed. For example, in the `de_CH.UTF-8` locale, the decimal point is a `,` instead of a `.`.

## What is `LC_COLLATE` and what are collations?

👉 See [Collations](collations.md)
