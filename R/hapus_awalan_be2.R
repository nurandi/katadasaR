## Remove suffix berke-

HapusAwalanBe2 <- function(kata) {

  # berke-
  if ( grepl("^berke", kata) ) {

    kata1 <- sub("^berke", "", kata)
    if ( is_katadasar(kata1) ) {
      return(kata1)
    }

    kata2 <- HapusAkhiranIAnKan(kata1)
    if ( is_katadasar(kata2) ) {
      return(kata2)
    }
  }

}
