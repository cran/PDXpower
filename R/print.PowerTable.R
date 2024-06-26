##' @title Print PowerTable
##' @name print.PowerTable
##' @aliases print.PowerTable
##' @param x object of class 'PowerTable'.
##' @param digits the number of significant digits to use when printing.
##' @param ... Further arguments passed to or from other methods.
##' @return Object of \code{print.PowerTable} with elements
##' \item{data}{a data frame of estimated power across all combinations and \code{n} and \code{m}.}
##' @author Shanpeng Li \email{lishanpeng0913@ucla.edu}
##' @seealso \code{\link{PowerTable}}
##' @export
##'

print.PowerTable <- function(x, digits = 2, ...) {

  if (!inherits(x, "PowerTable"))
    stop("Use only with 'PowerTable' xs.\n")

  print <- x$print
  fixed.effect <- x$fixed.effect
  x$N <- x$NofLine*x$NofAnimals*2

  if (print == "both") {
    data <- data.frame(x$NofLine, x$NofAnimals, x$N,
                       round(x$ANOVArandom, digits = digits),
                       round(x$Coxrandom, digits = digits),
                       round(x$censoringrate, digits = digits))

    colnames(data) <- c("n", "m", "N", "ANOVA", "Cox's Frailty", "Censoring Rate")
  } else if (print == "Cox-frailty") {

    if (fixed.effect) {
      data <- data.frame(x$NofLine, x$NofAnimals, x$N,
                         round(x$Coxfix*100, digits = digits),
                         round(x$censoringrate, digits = digits))
      colnames(data) <- c("n", "m", "N", "Power (%) for Cox fixed effects", "Censoring Rate")
    } else {
      data <- data.frame(x$NofLine, x$NofAnimals, x$N,
                         round(x$Coxrandom*100, digits = digits),
                         round(x$censoringrate, digits = digits))
      colnames(data) <- c("n", "m", "N", "Power (%) for Cox's frailty", "Censoring Rate")
    }

  } else {
    if (fixed.effect) {
      data <- data.frame(x$NofLine, x$NofAnimals, x$N,
                         round(x$ANOVAfix*100, digits = digits))
      colnames(data) <- c("n", "m", "N", "Power (%) for fixed effects")

    } else {
      data <- data.frame(x$NofLine, x$NofAnimals, x$N,
                         round(x$ANOVArandom*100, digits = digits))
      colnames(data) <- c("n", "m", "N", "Power (%)")
    }


  }


  #cat("\nCall:\n", sprintf(format(paste(deparse(x$call, width.cutoff = 500), collapse = ""))), "\n\n")

  print(data)
}
