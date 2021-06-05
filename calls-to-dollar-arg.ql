import javascript
from CallExpr ce, Expr e
where ce.getCalleeName() = "$" and ce.getArgument(0) = e
select e
