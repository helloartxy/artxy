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

        displayCategoryToList();

    });


    //
    function displayCategoryToList(){
        $.ajax({
            url: "functions/getCategory.php",
            method: "get",
            success:     function(response){
                console.log(response);
            }
        });
    }
</script>
</head>
<body></body>

<form method="post">

Title: <input type="text" name="Title" id="title" /><br />
Description: <input type="text" name="Description" id="description" /></br />
<input type="hidden" name="category" value="3" />
Category: <select name="sub_category">

<?php 
    foreach($data as $key => $value){
        echo "<option value='".$value['ID']."'>" . $value['sub_category_name'] . "</option>";
    }
?>

</select>
<button id="submitForm">Submit</button>


</form>

</html>