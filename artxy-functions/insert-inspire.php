<?php 
include 'class/database.php';
$dbOut = new Database();

$data = $dbOut->select('sub_category', 'ID, sub_category_name', null ,'category_ID=3');
// $query = "SELECT ID, sub_category_name FROM sub_category WHERE category_ID='3'";
// $dbOut->sql($query);
$data = $dbOut->getResult();



 ?>
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