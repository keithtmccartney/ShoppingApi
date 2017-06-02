<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ShoppingApi.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function getAllDrinks() {
            $.ajax({
                type: "GET",
                url: "http://localhost:62913/Services/ShoppingService.svc/Drinks/",
                contentType: "json",
                dataType: "json",
                cache: false,
                success: function (data) {
                    $.each(data, function (key, value) {
                        var jsonData = JSON.stringify(value);
                        var objData = $.parseJSON(jsonData);
                        var id = objData.ID;
                        var name = objData.Name;
                        var quantity = objData.Quantity;

                        $('<tr><td>' + id + '</td><td>' + name + '</td><td>' + quantity + '</td></tr>').appendTo('#drinks');
                    });
                },
                error: function (xhr) {
                    alert(xhr.responseText);
                }
            });
        }

        function getDrinkByID() {
            var id = document.getElementById("DrinkID").value;

            $.ajax({
                type: "GET",
                url: "http://localhost:62913/Services/ShoppingService.svc/DrinksID/" + id,
                contentType: "json",
                dataType: "json",
                cache: false,
                success: function (data) {
                    var jsonData = JSON.stringify(data);
                    var objData = $.parseJSON(jsonData);
                    var id = objData.ID;
                    var name = objData.Name;
                    var quantity = objData.Quantity;

                    $('<tr><td>' + id + '</td><td>' + name + '</td><td>' + quantity + '</td></tr>').appendTo('#drinks');
                },
                error: function (xhr) {
                    alert(xhr.responseText);
                }
            });
        }

        function getDrinkByName() {
            var name = document.getElementById("DrinkName").value;

            $.ajax({
                type: "GET",
                url: "http://localhost:62913/Services/ShoppingService.svc/DrinksName/" + name,
                contentType: "json",
                dataType: "json",
                cache: false,
                success: function (data) {
                    var jsonData = JSON.stringify(data);
                    var objData = $.parseJSON(jsonData);
                    var id = objData.ID;
                    var name = objData.Name;
                    var quantity = objData.Quantity;

                    $('<tr><td>' + id + '</td><td>' + name + '</td><td>' + quantity + '</td></tr>').appendTo('#drinks');
                },
                error: function (xhr) {
                    alert(xhr.responseText);
                }
            });
        }

        function addNewDrink() {
            var id = document.getElementById("DrinkID").value;
            var name = document.getElementById("DrinkName").value;
            var quantity = document.getElementById("DrinkQuantity").value;
            var drinkData = {
                "ID": id,
                "Name": name,
                "Quantity": quantity
            };

            $.ajax({
                type: "POST",
                url: "http://localhost:62913/Services/ShoppingService.svc/AddDrink/" + id,
                data: JSON.stringify(drinkData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                processData: true,
                cache: false,
                success: function (data, status, jqXHR) {
                    alert(data);
                },
                error: function (xhr) {
                    alert(xhr.ResponseText);
                }
            });
        }

        function updateDrink() {
            var id = document.getElementById("DrinkID").value;
            var name = document.getElementById("DrinkName").value;
            var quantity = document.getElementById("DrinkQuantity").value;
            var drinkData = {
                "ID": id,
                "Name": name,
                "Quantity": quantity
            };

            $.ajax({
                type: "PUT",
                url: "http://localhost:62913/Services/ShoppingService.svc/UpdateDrink/" + id,
                data: JSON.stringify(drinkData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                processData: true,
                cache: false,
                success: function (data, status, jqXHR) {
                    alert(data);
                },
                error: function (xhr) {
                    alert(xhr.ResponseText);
                }
            });
        }

        function deleteDrink() {
            var id = document.getElementById("DrinkID").value;

            $.ajax({
                type: "DELETE",
                url: "http://localhost:62913/Services/ShoppingService.svc/DeleteDrink/" + id,
                contentType: "json",
                dataType: "json",
                cache: false,
                success: function (data) {
                    alert(data);
                },
                error: function () {
                    alert(xhr.ResponseText);
                }
            });
        }

        function resetGrid() {
            $("tr:gt(0)").remove();
        }
    </script>

    <style type="text/css">
        input {
            width: 150px;
        }

        table {
            width: 300px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                ID:
            <input id="DrinkID" type="number" min="1"/>
                Name:
            <input id="DrinkName" type="text"/>
                Quantity:
            <input id="DrinkQuantity" type="text"/><br /><br />
            <input id="GetDrinkByID" type="button" value="Get Drink by ID" onclick="getDrinkByID()"/>
            <input id="GetDrinkByName" type="button" value="Get Drink by Name" onclick="getDrinkByName()"/>
            <input id="GetAllDrinks" type="button" value="Get All Drinks" onclick="getAllDrinks()"/><br /><br />
            <input id="AddNewDrink" type="button" value="Add New Drink" onclick="addNewDrink()"/>
            <input id="UpdateDrink" type="button" value="Update Drink" onclick="updateDrink()"/>
            <input id="DeleteDrink" type="button" value="Delete Drink" onclick="deleteDrink()"/><br /><br /><br />

            <table border="1" id="drinks">
                <tr>
                    <td>Drink ID</td>
                    <td>Drink Name</td>
                    <td>Drink Quantity</td>
                </tr>
            </table><br /><br />

            <input id="Reset" type="button" value="Reset" onclick="resetGrid()"/>
        </div>
    </form>
</body>
</html>