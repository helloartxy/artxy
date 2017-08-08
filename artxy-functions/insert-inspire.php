<html>

<head>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script>

    $(function(){
        $("#submitForm").click(function(){
            var formData = {
                "title" : $("#title").val(),
                "description" : $("#description").val()
            }
            $.ajax({
                url: "functions/inspire/newInspire.php",
                method: "post",
                data: formData,
                success: function(response){
                    console.log(response);
                }

            });
            console.log(1);
        });
    });

</script>
</head>
<body></body>

<form method="post">

Title: <input type="text" name="Title" id="title" /><br />
Description: <input type="text" name="Description" id="description" /></br />
<button id="submitForm">Submit</button>


</form>

</html>