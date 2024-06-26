% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PowerTable.R
\name{PowerTable}
\alias{PowerTable}
\title{A function to obtain a power table with the combination of
various number of PDX lines and number of individuals per PDX lines per treatment.}
\usage{
PowerTable(
  n,
  m,
  beta,
  tau2 = 0.5,
  alpha = 0.05,
  lambda = 0.03,
  nu = 2,
  sigma2 = 1,
  two.sided = TRUE,
  distr = c("Weibull", "normal"),
  Ct = 5,
  censor = TRUE,
  sim = 1000,
  print = c("both", "ANOVA", "Cox-frailty"),
  fixed.effect = FALSE,
  ncores = NULL
)
}
\arguments{
\item{n}{an integer number to specify the number of PDX lines.}

\item{m}{an integer number to specify the number of individuals per PDX line per treatment.}

\item{beta}{Treatment effect for the treated group.}

\item{tau2}{variance of PDX line specific random effect.}

\item{alpha}{significance level. Default is 0.05.}

\item{lambda}{Scale parameter of Weibull distribution for the baseline hazard.}

\item{nu}{Shape parameter of Weibull distribution for the baseline hazard.}

\item{sigma2}{Error variance of log survival time for both treatment groups.}

\item{two.sided}{A logical value to indicate if a two-sided hypothesis testing is conducted.
Default is TRUE.}

\item{distr}{Distributional assumption of the simulated event time.}

\item{Ct}{a fixed time point when a study is designed to end for generating type 1 censoring data.}

\item{censor}{logical value of whether a censoring distribution is considered in a data generation setting. Default is TRUE.}

\item{sim}{Number of Monte Carlo samples to be generated. Default is 1000.}

\item{print}{a string to indicate which model result to be printed.
If \code{print = "both"}, then the power curves of both models will be printed.
Otherwise, print a power curve from one of the two models by specifying
either \code{print = "ANOVA"} or \code{print = "Cox-frailty"}.}

\item{fixed.effect}{logical value to indicate if a fixed effects only model is fitted. Default is FALSE.}

\item{ncores}{number of cores for parallel computation.}
}
\value{
Object of class \code{PowerTable} with elements
\item{NofLine}{the number of PDX line \code{n}.}
\item{NofAnimals}{the number of animals per arm per PDX line \code{m}.}
\item{ANOVArandom}{the proportion of rejecting null treatment effect by fitting a ANOVA mixed effects model.}
\item{Coxrandom}{the proportion of rejecting null treatment effect by fitting a Cox frailty model.}
\item{ANOVAfix}{the proportion of rejecting null treatment effect by fitting a ANOVA fixed effects model if \code{fixed.effects = TRUE}.}
\item{Coxfix}{the proportion of rejecting null treatment effect by fitting a Cox fixed effects model if \code{fixed.effects = TRUE}.}
\item{censoringrate}{the average censoring rate across all Monte Carlo replicates.}
\item{beta}{the pre-determined treatment effect.}
\item{lambda}{the pre-determined scale parameter of baseline hazard for the Cox frailty model.}
\item{nu}{the pre-determined shape parameter of baseline hazard for the Cox frailty model.}
\item{tau2}{the pre-determined inter-PDX variance.}
\item{Ct}{the pre-determined fixed time point to indicate the end of a study for type I censoring.}
\item{nsim}{total number of Monte Carlo replicates.}
\item{sigma2}{the pre-determined error variance for the ANOVA mixed effects model.}
\item{censor}{a logical value to indicate whether type I censoring mechanism is considered for simulation.}
\item{print}{a string to indicate which model is considered for simulation.}
\item{fixed.effect}{a logical value to indicate whether a fixed effects model is considered for simulation.}
\item{call}{match call.}
}
\description{
A function to obtain a power table with the combination of
various number of PDX lines and number of individuals per PDX lines per treatment.
}
\examples{
n <- 3
m <- 2
beta <- 0.8
lambda <- 0.3
nu <- 1
tau2 <- 0.1
\donttest{
fit <- PowerTable(n = n, m = m, beta = beta, lambda = lambda, nu = nu,
                  tau2 = tau2, distr = "Weibull", sim = 5,
                  censor = FALSE,
                  print = "both", ncores = 1)
plotpower(fit, ylim = c(0, 1))
}

}
\seealso{
\code{\link{plotpower}}
}
