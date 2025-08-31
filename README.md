# Typst Joyner Document Format

Welcome to the Typst version of the **2022 update** of the [Joyner Document Format](https://github.com/iamjakewarner/jdf).

## Typst Installation

Please see the Typst installation instructions [here](https://github.com/typst/typst?tab=readme-ov-file#installation).

## Typst CLI Quick start

You can clone this repo and try typesetting `jdf-starter.typ`
with the following command:

```sh
typst compile jdf-starter.typ
```

The result should look like `jdf-starter.pdf`. To automatically re-compile whenever changes are saved to your document, run the following command:

```sh
typst watch jdf-starter.typ
```

## Use jdf.typ machine-wide (recommended)

Please see the Typst instructions to add the configuration machine-wide [here](https://github.com/typst/packages?tab=readme-ov-file#local-packages). This process is temporary until the Typst JDF configuration has been submitted to the Typst Universe as a Typst package.

## Use jdf.typ locally

To use the Typst config locally only, copy `jdf.typ` into your working directory, add something like this to the
top of the document you're working on, and starting writing normally.
Please note that the abstract is completely optional:

```typst
#import "jdf.typ": *

#show: conf.with(
  title: [My Document Title],
  author: (
    name: "Author Name",
    email: "username@gatech.edu",
  ),
  abstract: [My abstract]
)
```
