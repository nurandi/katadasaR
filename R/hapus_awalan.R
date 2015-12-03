## Delete prefixes

HapusAwalan <- function(kata) {

  kata <- HapusAwalanDiKeSe(kata)
  return(kata)

}


## Delete prefix di-, ke-, se
## eg. dimakan, kekuatan, sehati

HapusAwalanDiKeSe <- function(kata) {

  if ( grepl("^(di|[ks]e)", kata) ) {
    kata1 <- sub("^(di|[ks]e)", "", kata)

    if ( is_katadasar(kata1) ) {
      kata <- kata1
    }

    kata2 <- HapusAkhiranIAnKan(kata1)

    if ( is_katadasar(kata2) ) {
      kata <- kata2
    }

  }

  return(kata)

}

