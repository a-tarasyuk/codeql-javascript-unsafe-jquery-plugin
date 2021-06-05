import javascript

from
    DataFlow::FunctionNode f,
    DataFlow::ParameterNode p
where f = jquery().getAPropertyRead("fn").getAPropertySource()
    and f.getLastParameter() = p
select f, p
