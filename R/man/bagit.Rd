% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bag.R
\name{bagit}
\alias{bagit}
\title{Since we don't have a way of getting the bagit module in R,
all we can do is use the default bag function by calling the
full python file on a directory. This will create a bag.
Warning: This often has system call issues in windows OS.}
\usage{
bagit(dir_bag)
}
\arguments{
\item{char}{dir_bag: The path to the directory that needs to be bagged}
}
\value{
bool: Bagit success
}
\description{
Since we don't have a way of getting the bagit module in R,
all we can do is use the default bag function by calling the
full python file on a directory. This will create a bag.
Warning: This often has system call issues in windows OS.
}
\keyword{internal}
