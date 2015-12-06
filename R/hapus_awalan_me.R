## Remove prefix me-

HapusAwalanMe <- function(kata) {

  if ( grepl("^me", kata) ) {

    if (grepl("^me[lrwyv][aiueo]", kata) ) {

      kata1 <- sub("^me", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if (grepl("^mem[bfvp]", kata) ) {

      kata1 <- sub("^mem", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if (grepl("^memr?[aiueo]", kata) ) {

      kata1 <- sub("^mem", "m", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^mem", "p", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if (grepl("^men[cdjszt]", kata) ) {

      kata1 <- sub("^men", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if (grepl("^men[aiueo]", kata) ) {

      kata1 <- sub("^men", "n", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^men", "t", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if (grepl("^meng[ghqk]", kata) ) {

      kata1 <- sub("^meng", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if (grepl("^meng[aiueo]", kata) ) {

      kata1 <- sub("^meng", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^meng", "k", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^menge", "", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }
    }

    if (grepl("^meny[aiueo]", kata) ) {

      kata1 <- sub("^meny", "s", kata)
      if ( is_katadasar(kata1) ) {
        return(kata1)
      }

      kata2 <- HapusAkhiranIAnKan(kata1)
      if ( is_katadasar(kata2) ) {
        return(kata2)
      }

      kata1 <- sub("^me", "", kata)
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
