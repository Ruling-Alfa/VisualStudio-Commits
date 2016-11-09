<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestLocation.aspx.cs" Inherits="TestLocation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <p>Click the button to get your coordinates.</p>

<button onclick="getLocation()">Try It</button>

<p id="demo"></p>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAlC24pTAtwNfqlXYY5zlYHghL5mJzGrVs"></script> 
<script type="text/javascript">
    var x = document.getElementById("demo");

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition, showError);
        } else {
            x.innerHTML = "Geolocation is not supported by this browser.";
        }
    }

    function showPosition(position) {
        x.innerHTML = "Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude;
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;
        //alert("lat:" + lat + " lng:" + lng);
        submitData2(lat,lng);
    }

    function showError(error) {
        
        switch (error.code) {
            case error.PERMISSION_DENIED:
                x.innerHTML = "User denied the request for Geolocation."
                break;
            case error.POSITION_UNAVAILABLE:
                x.innerHTML = "Location information is unavailable."
                break;
            case error.TIMEOUT:
                x.innerHTML = "The request to get user location timed out."
                break;
            case error.UNKNOWN_ERROR:
                x.innerHTML = "An unknown error occurred."
                break;
        }
    }

////

    function submitData2(latt, long) {
        var mapForm = document.createElement("FORM");
        mapForm.method = "GET";
        mapForm.action = "TestLoc2.aspx"

        // Create an input
        var mapInput1 = document.createElement("INPUT");
        mapInput1.type = "hidden";
        mapInput1.name = "lat";
        mapInput1.value = latt

        var mapInput2 = document.createElement("INPUT");
        mapInput2.type = "hidden";
        mapInput2.name = "lon";
        mapInput2.value = long;

        // Add the input to the form
        mapForm.appendChild(mapInput1);
        mapForm.appendChild(mapInput2);

        // Add the form to dom
        document.body.appendChild(mapForm);

        // Just submit
        mapForm.submit();

        // Remove mapForm 
        document.body.removeChild(mapForm);
    }

</script>

</body>
</html>
