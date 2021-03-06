% File src/library/base/man/dput.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2011 R Core Development Team
% Distributed under GPL 2 or later

\name{dput}
\alias{dput}
\alias{dget}
\title{Write an Object to a File or Recreate it}
\description{
  Writes an ASCII text representation of an \R object to a file
  or connection, or uses one to recreate the object.
}
\usage{
dput(x, file = "",
     control = c("keepNA", "keepInteger", "showAttributes"))

dget(file)
}
\arguments{
  \item{x}{an object.}
  \item{file}{either a character string naming a file or a
    \link{connection}. \code{""} indicates output to the console.}
  \item{control}{character vector indicating deparsing options.
    See \code{\link{.deparseOpts}} for their description.}
}
\details{
  \code{dput} opens \code{file} and deparses the object \code{x} into
  that file.  The object name is not written (unlike \code{dump}).
  If \code{x} is a function the associated environment is stripped.
  Hence scoping information can be lost.

  Deparsing an object is difficult, and not always possible.  With the
  default \code{control}, \code{dput()} attempts to deparse in a way
  that is readable, but for more complex or unusual objects (see
  \code{\link{dump}}, not likely
  to be parsed as identical to the original.  Use \code{control = "all"}
  for the most complete deparsing; use \code{control = NULL} for the
  simplest deparsing, not even including attributes.

  \code{dput} will warn if fewer characters were written to a file than
  expected, which may indicate a full or corrupt file system.
    
  To display saved source rather than deparsing the internal representation 
  include \code{"useSource"} in \code{control}.  \R currently saves
  source only for function definitions.
}
\value{
  For \code{dput}, the first argument invisibly.

  For \code{dget}, the object created.
}
\note{
  To avoid the risk of a source attribute out of sync with the actual
  function definition, the source attribute of a function will never 
  be written as an attribute.
}    
\references{
  Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988)
  \emph{The New S Language}.
  Wadsworth & Brooks/Cole.
}
\seealso{
  \code{\link{deparse}}, \code{\link{dump}}, \code{\link{write}}.
}
\examples{
## Write an ASCII version of mean to the file "foo"
dput(mean, "foo")
## And read it back into 'bar'
bar <- dget("foo")
unlink("foo")
## Create a function with comments
baz <- function(x) {
  # Subtract from one
  1-x
}
## and display it
dput(baz)
## and now display the saved source
dput(baz, control = "useSource")
}
\keyword{file}
\keyword{programming}
\keyword{connection}
