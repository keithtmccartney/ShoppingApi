<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ShoppingApi.NonSelfHosting.Web.Index" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function GetAllDrinks() {
            $.ajax({
                type: "GET",
                url: "http://localhost:62913/Services/ShoppingService.svc/Drinks/",
                contentType: "json",
                dataType: "json",
                /*cache: false,*/
                success: function (data) {
                    $.each(data, function (key, value) {
                        //stringify
                        var jsonData = JSON.stringify(value);

                        //Parse JSON
                        var objData = $.parseJSON(jsonData);
                        var drinkId = objData.DrinkId;
                        var name = objData.Name;
                        var quantity = objData.Quantity;

                        $('<tr><td>' + drinkId + '</td><td>' + name + '</td><td>' + quantity + '</td></tr>').appendTo('#drinks');
                    });
                },
                error: function (xhr) {
                    alert(xhr.responseText);
                }
            });
        }

        function GetDrinkByID() {
            /*var id = document.getElementById("TextId").value;*/
            $.ajax({
                type: "GET",
                url: "http://localhost:62913/Services/ShoppingService.svc/Drink/" + id,
                contentType: "json",
                dataType: "json",
                /*cache: false,*/
                success: function (data) {
                    //stringify
                    var jsonData = JSON.stringify(data);

                    //Parse JSON
                    var objData = $.parseJSON(jsonData);
                    var drinkId = objData.DrinkId;
                    var name = objData.Name;
                    var quantity = objData.Quantity;

                    $('<tr><td>' + drinkId + '</td><td>' + name + '</td><td>' + quantity + '</td></tr>').appendTo('#drinks');
                },
                error: function (xhr) {
                    alert(xhr.responseText);
                }
            });
        }

        function AddDrink() {
            /*var name = document.getElementById("TextName").value;
            var quantity = document.getElementById("TextQuantity").value;*/

            var drinkData = {
                "DrinkId": 0,
                "Name": name,
                "Quantity": quantity
            };

            $.ajax({
                type: "PUT",
                url: "http://localhost:62913/Services/ShoppingService.svc/AddDrink/",
                data: JSON.stringify(drinkData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                processData: true,
                /*cache: false,*/
                success: function (data, status, jqXHR) {
                    alert("success..." + data);
                },
                error: function (xhr) {
                    alert(xhr.ResponseText);
                }
            });
        }

        function UpdateDrink() {
            /*var id = document.getElementById("TextId").value;
            var name = document.getElementById("TextName").value;
            var quantity = document.getElementById("TextQuantity").value;*/

            var drinkData = {
                "DrinkId": id,
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
                /*cache: false,*/
                success: function (data, status, jqXHR) {
                    alert("success..." + data);
                },
                error: function (xhr) {
                    alert(xhr.ResponseText);
                }
            });
        }

        function DeleteDrink() {
            /*var id = document.getElementById("TextId").value;*/

            $.ajax({
                type: "DELETE",
                url: "http://localhost:62913/Services/ShoppingService.svc/DeleteDrink/" + id,
                contentType: "json",
                dataType: "json",
                /*cache: false,*/
                success: function (data) {
                    alert("success..." + data);
                },
                error: function () {
                    alert(xhr.ResponseText);
                }
            });
        }

        //function saveDrink() {
        //    var drinkData = {
        //        "DrinkId": 0,
        //        "Name": "Abc",
        //        "Quantity": 1
        //    };

        //    $.ajax({
        //        type: "POST",
        //        url: "http://localhost:62913/Services/ShoppingService.svc/SaveDrink/0",
        //        data: JSON.stringify(drinkData),
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        processData: true,
        //        /*cache: false,*/
        //        success: function (data, status, jqXHR) {
        //            alert("success…" + data);
        //        },
        //        error: function (xhr) {
        //            alert(xhr.responseText);
        //        }
        //    });
        //}

        function resetTabla() {
            //$('<tr><td>' + '</td><td>' + '</td><td>' + '</td></tr>').appendTo('#drinks');

            alert("deleting");

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
<body onload="GetAllDrinks()">
    <form id="form1" runat="server">
        <div>
            <input id="GetAllDrinks" type="button" value="Get All Drinks" onclick="GetAllDrinks()"/>ID:
            <input id="TextId" type="number" min="1"/>
            <input id="GetDrinkByID" type="button" value="Get Drink by ID" onclick="GetDrinkByID()"/>
            <input id="AddDrink" type="button" value="Add Drink" onclick="addDrink()"/>
            <input id="DeleteDrink" type="button" value="Delete Drink" onclick="DeleteDrink()"/>Name:
            <input id="TextName" type="text"/>Name:
            <input id="TextQuantity" type="text"/>
            <input id="UpdateDrink" type="button" value="Update Drink" onclick="UpdateDrink()"/>
            <input id="SaveDrink" type="button" value="Save Drink" onclick="SaveDrink()"/>
            <input id="Reset" type="button" value="Reset tabla" onclick="resetTabla()"/>

            <table border='1' id="drinks">
                <!-- Make a Header Row -->
                <tr>
                    <td>
                        <b>Drink ID</b>
                    </td>
                    <td>
                        <b>Name</b>
                    </td>
                    <td>
                        <b>Quantity</b>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>