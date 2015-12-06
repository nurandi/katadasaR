## Remove prefix te-

HapusAwalanTe <- function(kata) {

  if ( grepl("^te", kata) ) {

    if ( grepl("^terr", kata) ) {
      return(kata)
    }

    if ( grepl("^ter[aioue]", kata) ) { ## terindah, terindang

      kata1 <- sub("^ter","r", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^ter", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^ter[^aiueor]er[aiueo]", kata) ) { ## terserah

      kata1 <- sub("^ter", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^ter[^aiueor](?!er)", kata, perl=T) ) { ## terkaya

      kata1 <- sub("^ter", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^te[^aiueor]er[aiueo]", kata) ) {

      kata1 <- sub("^te", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^ter[^aiueor]er[^aiueo]", kata) ) { #terjerat

      kata1 <- sub("^ter", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

    }
  }
}

