## Remove suffix memper-, mempel-, menter-, member-

HapusAwalanMe2 <- function(kata) {

  # memper-
  if ( grepl("^memper", kata) ) {

    kata1 <- sub("^memper", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }

    kata1 <- sub("^memper", "r", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }

  # mempel-
  if ( grepl("^mempel", kata) ) {

    kata1 <- sub("^mempel", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }

    kata1 <- sub("^mempel", "l", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }

  # menter-
  if ( grepl("^menter", kata) ) {

    kata1 <- sub("^menter", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }

    kata1 <- sub("^menter", "r", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }

  # menber-
  if ( grepl("^menber", kata) ) {

    kata1 <- sub("^menber", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }

    kata1 <- sub("^menber", "r", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }
}

