# ShoppingApi
A web service to manage a shopping list

The Service is a WCF-based REST service with LocalHost ports.

The Client to hook into the endpoints is a simple Web page with AJAX calls for the following HTTP methods:

* POST to add a drink to the shopping bag with quantity (e.g. Name of the drink - Pepsi - and Quantity - 1).
* PUT to update the quantity of each drink in the shopping bag.
* DELETE to delete a drink from the shopping bag.
* GET to retrieve a drink by calling its name so that its quantity is displayed.
* GET to retrieve the list of items within the shopping bag.

## Instructions

* [Web page](e.g. http://localhost:62913/Index.aspx) ...on firing up the solution the Index.aspx will load...
* [WCF-based REST Service](e.g. http://localhost:62913/Services/ShoppingService.svc) ...the service itself will fire up on the same allocated port...
