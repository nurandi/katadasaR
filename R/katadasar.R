#' @export
#' katadasar katadasaR
#'
#' @title
#' Word stemming for Bahasa Indonesia
#'
#' @name katadasar
#' @aliases katadasaR
#' @aliases katadasar
#'
#' @description
#' Provides a function to retrieve word stem (a.k.a. word stemming)
#' for Bahasa Indonesia using Nazief and Andriani's algorithm. It consists of
#' set of functions to remove prefixes, suffixes or both, but still unable for
#' infixes removal.
#' This package is ported from C sharp code provided by csharp-indonesia
#' \url{http://www.csharp-indonesia.com/2014/07/algoritma-stemming-pencarian-kata-dasar.html}.
#' Credit goes to original author(s).\cr\cr
#' \code{katadasar} or \code{katadasaR} checks if a word is word stem according
#' dictionary and do stemming process if it is an affixed word.
#'
#' @author
#' Nur Andi Setiabudi \email{nurandi.mail@@gmail.com}
#'
#' @param kata string vector of length 1, word or token from which word stem is
#' retrieved.
#'
#' @param kamus string vector, additional dictionary to be included.
#'
#' @examples \dontrun{
#' ## Stem one word
#'   katadasaR("kemanusiaan")
#'
#' ## A set of words
#'  words <- c("jakarta", "seminar", "penggunaan", "menggurui", "pelajaran", "dimana")
#'  sapply(words, katadasaR)
#'
#' }
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Stemming}\cr
#' \url{http://crpit.scem.westernsydney.edu.au/confpapers/CRPITV38Asian.pdf}
#'


katadasaR <- function(kata, kamus=NULL) {

  if ( length(kata) != 1 ) {
    stop("Input should be a vector of length 1.")
  }

  kata0 <- kata

  if ( is_katadasar(kata, kamus) ) {

    return(kata)

  } else {

    kata <- HapusAkhiran(kata)
    if ( !is.null(kata) ) {
      if ( is_katadasar(kata, kamus) ) {
        return(kata)
      }
    }

    kata <- HapusAkhiranIAnKan(kata)
    if ( !is.null(kata) ) {
      if ( is_katadasar(kata, kamus) ) {
        return(kata)
      }
    }

    kata <- HapusAwalan(kata)
    if ( !is.null(kata) ) {
      if ( is_katadasar(kata, kamus) ) {
        return(kata)
      }
    }
  }

  return(kata0)

}

katadasar <- katadasaR

