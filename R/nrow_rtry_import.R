#nrows_rtry_import helps to determine how many rows of data are in a try file
#based on the original rtry::rtry_import version 1.1.0

nrow_rtry_import <- function (input,
                                 separator = "\t", 
                                 encoding = "Latin-1", 
                                 quote = "", 
                                 showOverview = TRUE) 
{
  if (missing(input)) {
    message("Please specify the input file.")
  }
  else {
    nrow_TRYdata <- nrow(data.table::fread(input, header = TRUE, 
                                 select = 1L,
                                 sep = separator, 
                                 dec = ".", 
                                 encoding = encoding, 
                                 quote = quote, 
                                 data.table = TRUE))
    if (showOverview == TRUE) {
      message("input: ", input)
      message("dim:   ", paste0(dim(nrow_TRYdata), sep = " "))
      message("col:   ", paste0(colnames(nrow_TRYdata), sep = " "))
    }
    return(nrow_TRYdata)
  }
}
