## Remove prefixes

HapusAwalan <- function(kata) {

  if ( grepl("^di|[ks]e", kata) ) {

    kata1 <- HapusAwalanDiKeSe(kata)
    if ( !is.null(kata1) ) {
      return(kata1)
    }

    kata1 <- HapusAwalanDi2(kata) # diper-, dkk
    if ( !is.null(kata1) ) {
      return(kata1)
    }

    kata1 <- HapusAwalanKe2(kata) # keter-, dkk
    if ( !is.null(kata1) ) {
      return(kata1)
    }

  }

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

    kata1 <- HapusAwalanMe2(kata) # memper-, menter-, dkk
    if ( !is.null(kata1) ) {
      return(kata1)
    }

    kata1 <- HapusAwalanBe2(kata) # berke-, dkk
    if ( !is.null(kata1) ) {
      return(kata1)
    }

  }
}
