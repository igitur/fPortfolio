\name{portfolio-riskPfolio}


\alias{riskPfolio}

\alias{pfolioVaR}
\alias{pfolioCVaR}
\alias{pfolioCVaRplus}
\alias{lambdaCVaR}

\alias{pfolioMaxLoss}
\alias{pfolioReturn}
\alias{pfolioTargetReturn}
\alias{pfolioTargetRisk}
\alias{pfolioSigma}
\alias{pfolioHist}


\title{Risk and Related Measures for Portfolios}


\description{
  
    Computes Value-at-Risk and related measures 
    for a portfolio of assets. 

    The functions are:

    \tabular{ll}{
    \code{pfolioVaR} \tab computes Value-at-Risk for a portfolio of assets, \cr
    \code{pfolioCVaRplus} \tab computes Value-at-Risk+ for a portfolio of assets, \cr
    \code{pfolioCVaR} \tab computes Conditional Value-at-Risk for a PF of assets, \cr
    \code{lambdaCVaR} \tab computes CVaR's atomic split value lambda, \cr
    \code{pfolioMaxLoss} \tab computes Maximum Loss for a portfolio of assets, \cr
    \code{pfolioReturn} \tab computes return values of a portfolio, \cr
    \code{pfolioTargetReturn} \tab computes the target return of a portfolio, \cr
    \code{pfolioTargetRisk} \tab computes the target risk of a portfolio, \cr
    \code{pfolioHist} \tab plots a histogram of the returns of a portfolio. }
    
}
    

\usage{
pfolioVaR(x, weights = NULL, alpha = 0.05) 
pfolioCVaRplus(x, weights = NULL, alpha = 0.05) 
pfolioCVaR(x, weights = NULL, alpha = 0.05) 
lambdaCVaR(n, alpha = 0.05) 

pfolioMaxLoss(x, weights = NULL)
pfolioReturn(x, weights = NULL, geometric = FALSE) 
pfolioTargetReturn(x, weights = NULL)
pfolioTargetRisk(x, weights = NULL)
pfolioHist(x, weights = NULL, alpha = 0.05, range = NULL, details = TRUE, \dots)
}


\arguments{
  
    \item{x}{
        a 'timeSeries' object, data frame or any other rectangular
        object which can be expressed as a matrix. The first 
        dimension is the number of observations, we call it \code{n},
        and the second is the number of assets in the data set,
        we call it \code{dim}.
        }
    \item{weights}{
        usually a numeric vector which has the length of the number of 
        assets. The weights measures the normalized weights of the 
        individual assets. By default \code{NULL}, then an equally 
        weighted set of assets is assumed. 
        }
    \item{geometric}{
        a logical flag, should geometric returns be used, by default FALSE
        }
    \item{alpha}{
        a numeric value, the confidence interval, by default 0.05.
        }
    \item{details}{
        a logical value, should details be printed?
        }
    \item{n}{
        the number of observation from which the CVaR's atomic split 
        value \code{lambda=1-floor(alpha*n)/(alpha*n)} will be 
        evaluated.
        }
    \item{range}{
        a numeric vector of two elements limiting the plot range of
        the histogram. This is quite useful if one likes to compare
        several plots on the same scale. If \code{range=NULL}, the
        default value, then the range will be selected automatically.
        }
    \item{\dots}{
        optional arguments to be passet to the function \code{hist}.
        }
            
}


\details{

    The percentile measures of loss (or reward) are defined in the 
    following way: Let \eqn{f(x ,y)} be a loss functions depending 
    upon a decision vector \eqn{x = (x_1, ..., x_n )} and a random 
    vector \eqn{y = (y_1, ..., y_m)}, then 
    
    \emph{pfolioVaR} is the alpha-percentile of the loss distribution, a 
    smallest value such that the probability that losses exceed or 
    are equal to this value is greater or equal to alpha.
    
    \emph{pfolioCVaRplus} or "CVaR+" or the "upper CVaR" are the expected  
    losses strictly exceeding VaR. This is also also called "Mean 
    Excess Loss" and "Expected Shortfall".

    \emph{pfolioCVaR} is a weighted average of VaR and CVaRplus defined as
    \eqn{CVaR = lambda*VaR + (1-lambda)} CVaRplus, for 
    \eqn{0 <= lambda <= 1}.
    
    Note, CVaR is convex, but VaR and CVaRplus may be non-convex. The 
    following inequalities are valid: \eqn{VaR <= CVaR <= CVaRplus}.

}


\value{

    \code{pfolioVaR}
    \cr
    returns the value of risk, VaR,  for a portfolio of assets, a
    numeric value.
    \cr
    
    \code{pfolioCVaRplus}
    \cr
    returns the conditional value of risk plus, CVaRplus, for a 
    portfolio of assets, a numeric value.
    \cr
    
    \code{pfolioCVaR}
    \cr
    returns the conditional value of risk, CVaR, for a portfolio
    of assets, a numeric value.
    \cr
    
    \code{lambdaCVaR}
    \cr
    returns CVaR's atomic split value \code{lambda}, a numeric value.
    \cr
    
    \code{pfolioMaxLoss}
    \cr
    returns the maximum loss value of the portfolio, a numeric value.
    \cr
    
    \code{pfolioReturn}
    \cr
    returns the total portfolio return computed from the set of
    assets \code{x}, a numeric vector.
    \cr
    
    \code{pfolioTargetReturn}
    \cr
    returns the total return or target return computed from the set of
    assets \code{x} and weights \code{weights}, a numeric value.
    \cr
    
    \code{pfolioTargetRisk}
    \cr
    returns the total risk (Sigma) or target risk computed from the set 
    of assets \code{x} and \code{weights} via the formual
    \code{sqrt(weights \%*\% cov(x) \%*\% weights)}, a numeric value.
    \cr
    
    \code{pfolioHist}
    \cr
    plots a histogram of portfolio returns and adds the values
    for the VaR (blue), for the CVaRplus (red), and for the 
    maximum loss (green) to the histogram plot. The function 
    invisibly returns a list with the following elements: VaR,
    VaRplus, maxLoss, mean, and sd. If \code{details} is \code{TRUE}, 
    then the result is printed.
          
}


\references{

Uryasev S. (2000);
    \emph{Conditional Value-at-Risk (CVaR): Algorithms and Applications},
    Risk Management and Financial Engineering Lab, University of Florida

Wuertz, D., Chalabi, Y., Chen W., Ellis A. (2009);
    \emph{Portfolio Optimization with R/Rmetrics}, 
    Rmetrics eBook, Rmetrics Association and Finance Online, Zurich.
      
}


\keyword{math}

