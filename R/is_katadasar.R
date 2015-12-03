## Test if word is a root word
## Allow to use additional dictionary of root words

is_katadasar <- function(kata, kamus=NULL) {

  if ( is.null(kamus) ) {
    kata_dasar <- unique(kamus_katadasar)
  } else if ( is.vector(kamus) ) {
    kata_dasar <- unique(c(kamus_katadasar, kamus))
  } else {
    stop("Additional dictionary should be input vector!")
  }

  b <- !is.na(match(kata, kata_dasar))

  return(b)

}
