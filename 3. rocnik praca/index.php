<?php

require_once 'config.php'; //starts session with certain security measures

if (empty($_SESSION['user_id'])) { //checks if user actually logged in or not
    header("Location: login.php");
    exit();
} else {
    $userID = $_SESSION['user_id'];
}
?>

<script>
    window.addEventListener("beforeunload", function (e) {
        // deletes any cookies and data to ensure no security
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "destroy_session.php", true);
        xhr.send();
    });
</script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    
    <h3>Signup</h3>

    <form action="includes/formhandler.inc.php" method="post">
        
        <input type="text" name="name" placeholder="Name">
        <input type="text" name="surname" placeholder="Surname">
        <input type="text" name="username" placeholder="Username">
        <input type="password" name="passwd" placeholder="Password">
        <input type="text" name="email" placeholder="E-mail">
        <input type="number" name="age" placeholder="Age">
        <input type="date" name="dateofbirth" placeholder="Date of Birth">
        <input type="text" name="country" placeholder="Country">
        <button>Signup</button>

    </form>
    
    <?php
    echo $userID;
    ?>
</body>
</html>