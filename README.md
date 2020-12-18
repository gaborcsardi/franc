
# franc

> Detect the Language of Text

<!-- badges: start -->

[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org)
[![R build
status](https://github.com/gaborcsardi/franc/workflows/R-CMD-check/badge.svg)](https://github.com/gaborcsardi/franc/actions)
[![](https://www.r-pkg.org/badges/version/franc)](https://www.r-pkg.org/pkg/franc)
[![CRAN RStudio mirror
downloads](https://cranlogs.r-pkg.org/badges/franc)](https://www.r-pkg.org/pkg/franc)
[![Coverage
Status](https://img.shields.io/codecov/c/github/gaborcsardi/franc/master.svg)](https://codecov.io/github/gaborcsardi/franc?branch=master)

<!-- badges: end -->

Franc has no external dependencies and supports 310 languages; all
languages spoken by more than one million speakers. Franc is a port of
the JavaScript project of the same name, see
<https://github.com/wooorm/franc>.

## Installation

``` r
install.packages("franc")
```

## Usage

``` r
library(franc)
```

Simply supply the text, and franc detects its language:

``` r
franc("Alle menslike wesens word vry")
```

    #> [1] "afr"

``` r
franc("এটি একটি ভাষা একক IBM স্ক্রিপ্ট")
```

    #> [1] "ben"

``` r
franc("Alle mennesker er født frie og")
```

    #> [1] "nno"

``` r
head(franc_all("O Brasil caiu 26 posições"))
```

    #>   language     score
    #> 1      por 1.0000000
    #> 2      src 0.8800937
    #> 3      glg 0.8702576
    #> 4      snn 0.8637002
    #> 5      bos 0.8168618
    #> 6      hrv 0.8103044

`und` is the `undefined` language, this is returned if the input is too
short (shorter than 10 characters by default).

``` r
franc("the")
```

    #> [1] "und"

``` r
franc("the", min_length = 3)
```

    #> [1] "sco"

You can provide a whitelist or a blacklist:

``` r
franc_all("O Brasil caiu 26 posições",
    whitelist = c("por", "src", "glg", "spa"))
```

    #>   language     score
    #> 1      por 1.0000000
    #> 2      src 0.8800937
    #> 3      glg 0.8702576
    #> 4      spa 0.7995316

``` r
head(franc_all("O Brasil caiu 26 posições",
    blacklist = c("src", "glg", "lav")))
```

    #>   language     score
    #> 1      por 1.0000000
    #> 2      snn 0.8637002
    #> 3      bos 0.8168618
    #> 4      hrv 0.8103044
    #> 5      cat 0.8065574
    #> 6      spa 0.7995316

## Supported languages

The R version of franc supports 310 languages. By default only the
languages with more than 1 million speakers are used, this is 175
languages. The `min_speakers` argument can relax this, and allows using
more languages:

``` r
head(franc_all("O Brasil caiu 26 posições"))
```

    #>   language     score
    #> 1      por 1.0000000
    #> 2      src 0.8800937
    #> 3      glg 0.8702576
    #> 4      snn 0.8637002
    #> 5      bos 0.8168618
    #> 6      hrv 0.8103044

``` r
head(franc_all("O Brasil caiu 26 posições", min_speakers = 0))
```

    #>   language     score
    #> 1      lad 1.0000000
    #> 2      por 0.9442724
    #> 3      pov 0.8788147
    #> 4      ast 0.8677576
    #> 5      roh 0.8363556
    #> 6      src 0.8310482

## License

MIT © [Mango Solutions](https://github.com/mangothecat), Titus Wormer,
Maciej Ceglowski, Jacob R. Rideout, Kent S. Johnson, Gábor Csárdi
