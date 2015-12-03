## Find root word


katadasaR <- function(kata, kamus=NULL) {

  if ( is_katadasar(kata, kamus) ) {

    return(kata)

  } else {

    kata <- HapusAkhiran(kata)

    if ( is_katadasar(kata, kamus) ) {

      return(kata)

    }

    kata <- HapusAkhiranIAnKan(kata)

    if ( is_katadasar(kata, kamus) ) {

      return(kata)

    }

    kata <- HapusAwalan(kata)

    return(kata)

  }

}

katadasar <- katadasaR

