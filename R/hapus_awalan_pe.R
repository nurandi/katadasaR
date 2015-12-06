## Remove suffix pe-

HapusAwalanPe <- function(kata) {

  if ( grepl("^pe", kata) ) {

    if ( grepl("^pe[wy]", kata) ) {

      kata1 <- sub("^pe", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^per[aiueo]", kata) ) {

      kata1 <- sub("^per", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^per", "r", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^per[^aiueor][A-Za-z](?!er)", kata, perl=T) ) {

      kata1 <- sub("^per", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^per[^aiueor][A-Za-z](er)[aiueo]", kata) ) {

      kata1 <- sub("^per", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^pem[bfv]", kata) ) {

      kata1 <- sub("^pem", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^pemr?[aiueo]", kata) ) {

      kata1 <- sub("^pem", "m", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^per", "p", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^pen[cdjzt]", kata) ) {

      kata1 <- sub("^pen", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^pen[aiueo]", kata) ) {

      kata1 <- sub("^pen", "n", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^pen", "t", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^(peng)[^aiueo]", kata) ) {

      kata1 <- sub("^peng", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^(peng)[aiueo]", kata) ) {

      kata1 <- sub("^peng", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^peng", "k", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^penge", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^peny[aiueo]", kata) ) {

      kata1 <- sub("^peny", "s", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^pe", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^pel[aiueo]", kata) ) {

      kata1 <- sub("^pel", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^pe", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^pe[^rwylmn]er[aiueo]", kata) ) {

      kata1 <- sub("^pe", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^pe[^rwylmn](?!er)", kata, perl=T) ) {

      kata1 <- sub("^pe", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if ( grepl("^pe[^aiueo]er[^aiueo]", kata) ) {

      kata1 <- sub("^pe", "", kata)
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
