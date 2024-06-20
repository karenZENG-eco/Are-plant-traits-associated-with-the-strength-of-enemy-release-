#partial_rtry_import adds the option to read try data in sections
#based on the original rtry::rtry_import version 1.1.0

partial_rtry_import <- function (input, 
                                 nrows = 100000, #default to a hundred thousand rows
                                 skip = "__auto__", #default to starting from the first row
                                 separator = "\t", 
                                 encoding = "Latin-1", 
                                 quote = "", 
                                 showOverview = TRUE) 
{
  if (missing(input)) {
    message("Please specify the input file.")
  }
  else {
    
    TRYcolnames <- colnames(data.table::fread(input, header = TRUE, #read colnames first 
                                              nrows = 0, #
                                              sep = separator, # 
                                              dec = ".", #
                                              encoding = encoding, # 
                                              quote = quote, #
                                              data.table = TRUE)) #
    
    TRYdata <- data.table::fread(input, header = TRUE, 
                                 nrows = nrows, #
                                 skip = skip, #
                                 col.names = TRYcolnames,
                                 sep = separator, 
                                 dec = ".", 
                                 encoding = encoding, 
                                 quote = quote, 
                                 data.table = TRUE)
    if (showOverview == TRUE) {
      message("input: ", input)
      message("dim:   ", paste0(dim(TRYdata), sep = " "))
      message("col:   ", paste0(colnames(TRYdata), sep = " "))
    }
    return(TRYdata)
  }
}