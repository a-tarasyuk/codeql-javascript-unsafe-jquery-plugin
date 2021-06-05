import javascript
from DataFlow::Node n
where n = jquery().getAPropertyRead("fn").getAPropertySource()
select n
