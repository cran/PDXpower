% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PowFrailty.R
\name{PowFrailty}
\alias{PowFrailty}
\title{A function to obtain a power table with the combination of
various number of PDX lines and number of individuals per PDX lines per treatment based on a prior knowledge of median survival}
\usage{
PowFrailty(
  ctl.med.surv = 2.4,
  tx.med.surv = 4.8,
  nu = 1,
  tau2 = 0.1,
  n = NULL,
  m = NULL,
  sim = 1000,
  censor = FALSE,
  Ct = 5,
  two.sided = TRUE,
  alpha = 0.05,
  fixed.effect = FALSE,
  ncores = NULL
)
}
\arguments{
\item{ctl.med.surv}{a numeric value of the hypothesized medial survival in the control arm. Default is 2.4.}

\item{tx.med.surv}{a numeric value of the hypothesized medial survival in the treatment arm. Default is 4.8.}

\item{nu}{shape parameter of Weibull distribution for the baseline hazard. Default is 1, i.e., constant failure rate.}

\item{tau2}{variance of PDX line specific random effect. Default is 0.1.}

\item{n}{an integer number to specify the number of PDX lines.}

\item{m}{an integer number to specify the number of individuals per PDX line per treatment.}

\item{sim}{Number of Monte Carlo samples to be generated. Default is 1000.}

\item{censor}{logical value of whether a censoring distribution is considered in a data generation setting. Default is FALSE.}

\item{Ct}{a fixed time point when a study is designed to end for generating type 1 censoring data.}

\item{two.sided}{A logical value to indicate if a two-sided hypothesis testing is conducted. Default is TRUE.}

\item{alpha}{significance level. Default is 0.05.}

\item{fixed.effect}{logical value to indicate if a fixed effects only model is fitted. Default is FALSE.}

\item{ncores}{number of cores for parallel computation.}
}
\value{
Object of \code{PowFrailty} with elements
\item{PowTab}{the estimates of statistical power across \code{n} and \code{m}.}
}
\description{
A function to obtain a power table with the combination of
various number of PDX lines and number of individuals per PDX lines per treatment based on a prior knowledge of median survival
}
\examples{
\donttest{
require(PDXpower)
PowTab <- PowFrailty(ctl.med.surv = 2.4, tx.med.surv = 4.8, sim = 100,
n = 3, m = 2, ncores = 1)
PowTab
plotpower(PowTab, ylim = c(0, 1))
}
}
