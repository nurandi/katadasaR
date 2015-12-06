## Remove prefix be-

HapusAwalanBe <- function(kata) {

  if ( grepl("^be", kata) ) {

    if ( grepl("^ber[aiueo]", kata) ) { ## beriman, beraturan

      kata1 <- sub("^ber", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^ber","r", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^ber[^aiueor][A-Za-z](?!er)", kata, perl=T) ) {

      kata1 <- sub("^ber", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^ber[^aiueor][A-Za-z]er[aiueo]", kata) ) {

      kata1 <- sub("^ber", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^bel", kata) ) { ## belajar

      kata1 <- sub("^bel", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^be[^aiueor]er[^aiueo]", kata) ) { ## bekerja

      kata1 <- sub("^be", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^ber[^aiueor]", kata ) ) {

      kata1 <- sub("^ber", "", kata)
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
