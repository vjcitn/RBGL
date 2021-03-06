\name{dijkstra.sp}
\alias{dijkstra.sp}
\title{ Dijkstra's shortest paths using boost C++ }
\description{ dijkstra's shortest paths }

\usage{
dijkstra.sp(g,start=nodes(g)[1], eW=unlist(edgeWeights(g)))
}

\arguments{
  \item{g}{ instance of class graph }
  \item{start}{ character: node name for start of path }
  \item{eW}{ numeric: edge weights.  }
}

\details{
These functions are interfaces to the Boost graph library C++
routines for Dijkstra's shortest paths.

For some graph subclasses, computing the edge weights can be expensive.
If you are calling \code{dijkstra.sp} in a loop, you can pass the edge
weights explicitly to avoid the edge weight creation cost.

}

\value{
A list with elements:
\item{distance}{The vector of distances from \code{start} to each node
of \code{g}; includes \code{Inf} when there is no path from \code{start}.}
\item{penult}{A vector of indices 
(in \code{nodes(g)}) of predecessors corresponding to each node
on the path from that node back to \code{start}}. For example, if the
element one of this vector has value \code{10}, that means that the
predecessor of node \code{1} is node \code{10}. The next predecessor is
found by examining \code{penult[10]}.
\item{start}{The start node that was supplied in the call to
\code{dijkstra.sp}.}
}

\references{
Boost Graph Library ( www.boost.org/libs/graph/doc/index.html )

The Boost Graph Library: User Guide and Reference Manual;
by Jeremy G. Siek, Lie-Quan Lee, and Andrew Lumsdaine;
(Addison-Wesley, Pearson Education Inc., 2002), xxiv+321pp.
ISBN 0-201-72914-8
}

\author{ VJ Carey <stvjc@channing.harvard.edu> }

\seealso{\code{\link{bellman.ford.sp}}, \code{\link{dag.sp}}, \code{\link{johnson.all.pairs.sp}}, \code{\link{sp.between}} }

\examples{
con1 <- file(system.file("XML/dijkex.gxl",package="RBGL"), open="r")
dd <- fromGXL(con1)
close(con1)
dijkstra.sp(dd)
dijkstra.sp(dd,nodes(dd)[2])

con2 <- file(system.file("XML/ospf.gxl",package="RBGL"), open="r")
ospf <- fromGXL(con2)
close(con2)
dijkstra.sp(ospf,nodes(ospf)[6])
}
\keyword{ graphs }
