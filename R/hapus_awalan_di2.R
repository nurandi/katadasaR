## Remove suffix diper-, diter-, dipel-, diber-

HapusAwalanDi2 <- function(kata) {

  # diper-
  if ( grepl("^diper", kata) ) {

    kata1 <- sub("^diper", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }

    kata1 <- sub("^diper", "r", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }

  # diter-
  if ( grepl("^diter", kata) ) {

    kata1 <- sub("^diter", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }

    kata1 <- sub("^diter", "r", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }

  # dipel-
  if ( grepl("^dipel", kata) ) {

    kata1 <- sub("^dipel", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }

    kata1 <- sub("^dipel", "l", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }

  # diber-
  if ( grepl("^diber", kata) ) {

    kata1 <- sub("^diber", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }

    kata1 <- sub("^diber", "r", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }
}
