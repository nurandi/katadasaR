## Remove inflection suffixes
## -lah, -kah, -ku, -mu, -nya

HapusAkhiran <- function(kata) {

  if ( grepl("[A-Za-z]+([klt]ah|pun|ku|mu|nya)$", kata) ) {
    kata1 <- sub("([klt]ah|pun|ku|mu|nya)$","",kata)

    if ( grepl("[A-Za-z]+([klt]ah|pun)$", kata) ) {
      kata1 <- HapusAkhiranKepunyaan(kata1)
    }

  } else {
    kata1 <- kata
  }

  return(kata1)
}


## Remove possesive pronouns
## -ku, -mu, -nya

HapusAkhiranKepunyaan <- function(kata) {

  if ( grepl("[A-Za-z]+(nya|[km]u)$", kata) ) {
    kata = sub("(nya|[km]u)$","",kata)
  }

  return(kata)
}


## Remove derivation suffixes
## -i, -an, -kan

HapusAkhiranIAnKan <- function(kata) {

  if ( grepl("(kan)$", kata) ) {
    kata1 <- sub("(kan)$", "", kata)

    if ( is_katadasar(kata1) ) {
      kata <- kata1
    }
  }

  if ( grepl("(i|[^k]an)$", kata) ) {
    kata2 <- sub("(i|an)$", "", kata)

    if ( is_katadasar(kata2) ) {
      kata <- kata2
    }
  }

  return(kata)
}
