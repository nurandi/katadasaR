## Remove suffix keber-, keter-, kese-, ketidak-, ketidakber-

HapusAwalanKe2 <- function(kata) {

  # keber-
  if ( grepl("^keber", kata) ) {

    kata1 <- sub("^keber", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }

    kata1 <- sub("^keber", "r", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }

  # keter-
  if ( grepl("^keter", kata) ) {

    kata1 <- sub("^keter", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }

    kata1 <- sub("^keter", "r", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }

  # kese-
  if ( grepl("^kese", kata) ) {

    kata1 <- sub("^kese", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }

  # ketidak-
  if ( grepl("^ketidak[^b]", kata) ) {

    kata1 <- sub("^ketidak", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }

  # ketidak-
  if ( grepl("^ketidakb", kata) ) {

    kata1 <- sub("^ketidak", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAwalanBe(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }

    kata3 <- HapusAkhiranIAnKan(kata2)
    if ( is_katadasar(kata3) ) {
      return(kata3)
    }
  }

}
