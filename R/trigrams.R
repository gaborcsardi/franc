
## This is mostly after
## https://github.com/wooorm/trigram-utils/blob/master/index.js

trigrams <- function(text) ngrams(text, 3)

expression_symbols <- "[-!\"#$%&'()*+,\\./0123456789:;<=>?@]"

trim <- function(x) sub("\\s$", "", sub("^\\s*", "", x))

clean <- function(value) {
  value <- as.character(value)
  value <- gsub(pattern = expression_symbols, replacement = " ", value)
  value <- gsub(pattern = "\\s+", replacement = " ", value)
  value <- trim(value)
  tolower(value)
}

clean_trigrams <- function(value) {
  if (length(value) == 0) return(list())
  trigrams(paste0(' ', clean(value), ' '))
}

clean_trigrams_table <- function(value) {
  stopifnot(is.character(value), length(value) == 1)
  tab <- table(clean_trigrams(value))
  # This is the behavior of table before
  # https://github.com/wch/r-source/commit/09ae38a25149d02a21b19ef33c3d09ef92f72351
  # Not very important for us, but we had a test case for it.
  names(dimnames(tab)) <- ""
  tab
}
