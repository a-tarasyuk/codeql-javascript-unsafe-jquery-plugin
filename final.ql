import javascript
import DataFlow::PathGraph

class Configuration extends TaintTracking::Configuration {
    Configuration() {
        this = "XssUnsafeJQueryPlugin"
    }

    override predicate isSource(DataFlow::Node n) {
        exists(DataFlow::FunctionNode f
            | f = jquery().getAPropertyRead("fn").getAPropertySource()
            | n = f.getLastParameter())
    }

    override predicate isSink(DataFlow::Node s) {
        s = jquery().getACall().getArgument(0)
    }
}

from
    Configuration config,
    DataFlow::PathNode source,
    DataFlow::PathNode sink
where config.hasFlowPath(source, sink)
select
    sink,
    source,
    sink,
    "Potential XSS vulnerability in plugin."
