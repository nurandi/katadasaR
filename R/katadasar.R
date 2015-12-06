## Find root word


katadasaR <- function(kata, kamus=NULL) {

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

