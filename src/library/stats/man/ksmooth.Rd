% File src/library/stats/man/ksmooth.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2007 R Core Development Team
% Distributed under GPL 2 or later

\name{ksmooth}
\alias{ksmooth}
\title{Kernel Regression Smoother}
\description{
  The Nadaraya--Watson kernel regression estimate.
}
\usage{
ksmooth(x, y, kernel = c("box", "normal"), bandwidth = 0.5,
        range.x = range(x),
        n.points = max(100, length(x)), x.points)
}
\arguments{
 \item{x}{input x values}
 \item{y}{input y values}
 \item{kernel}{the kernel to be used.}
 \item{bandwidth}{the bandwidth. The kernels are scaled so that their
   quartiles (viewed as probability densities) are at
   \eqn{\pm}{+/-} \code{0.25*bandwidth}.}
 \item{range.x}{the range of points to be covered in the output.}
 \item{n.points}{the number of points at which to evaluate the fit.}
 \item{x.points}{points at which to evaluate the smoothed fit. If
   missing, \code{n.points} are chosen uniformly to cover \code{range.x}.}
}
\value{
  A list with components
  \item{x}{values at which the smoothed fit is evaluated. Guaranteed to
    be in increasing order.}
  \item{y}{fitted values corresponding to \code{x}.}
}
\note{This function is implemented purely for compatibility with S,
  although it is nowhere near as slow as the S function. Better kernel
  smoothers are available in other packages.}
\examples{
require(graphics)

with(cars, {
    plot(speed, dist)
    lines(ksmooth(speed, dist, "normal", bandwidth=2), col=2)
    lines(ksmooth(speed, dist, "normal", bandwidth=5), col=3)
})
}
\keyword{smooth}
