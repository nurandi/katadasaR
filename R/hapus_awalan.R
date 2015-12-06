## Remove prefixes

HapusAwalan <- function(kata) {

  HapusAwalanDiKeSe(kata)
  HapusAwalanBeTeMePe(kata)

}


## Remove prefix be-, te-, me-, pe-
## eg. bertanya, terjadi, menjadi, pelajar

HapusAwalanBeTeMePe <- function(kata) {

  if ( grepl("^[tmbp]e", kata) ) {

    kata1 <- HapusAwalanBe(kata)
    if ( !is.null(kata1) ) {
      return(kata1)
    }

    kata1 <- HapusAwalanTe(kata)
    if ( !is.null(kata1) ) {
      return(kata1)
    }

    kata1 <- HapusAwalanMe(kata)
    if ( !is.null(kata1) ) {
      return(kata1)
    }

    kata1 <- HapusAwalanPe(kata)
    if ( !is.null(kata1) ) {
      return(kata1)
    }

  }
}
