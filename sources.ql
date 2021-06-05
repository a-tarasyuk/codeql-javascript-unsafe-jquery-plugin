import javascript

predicate isSource(DataFlow::Node n) {
    exists(DataFlow::FunctionNode f
        | f = jquery().getAPropertyRead("fn").getAPropertySource()
        | n = f.getLastParameter())
}

from DataFlow::Node n
where isSource(n)
select n
