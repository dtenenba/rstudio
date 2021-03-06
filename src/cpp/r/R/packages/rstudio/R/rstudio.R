

versionInfo <- function() {
  info <- list()
  info$version <- package_version(utils:::packageDescription("rstudio", 
                                                             fields="Version"))
  info$mode <- .Call(getNativeSymbolInfo("rs_rstudioProgramMode", 
                                         PACKAGE=""))
  info
}

diagnosticsReport <- function() {
  invisible(.Call(getNativeSymbolInfo("rs_sourceDiagnostics", PACKAGE="")))
}

showPresentation <- function(directory = ".") {
   
   if (!is.character(directory))
      stop("directory must be of type character")
  
   invisible(.Call(getNativeSymbolInfo("rs_showPresentation", PACKAGE=""), 
                   .rs.normalizePath(path.expand(directory))))
}

showPresentationHelpDoc <- function(doc) {
  
  if (!is.character(doc))
    stop("doc must be of type character")
  
  invisible(.Call(getNativeSymbolInfo("rs_showPresentationHelpDoc", PACKAGE=""), 
                  doc))
}
