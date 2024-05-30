<?php
require_once 'config.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <h3> Log in </h3>

    <form action="includes/login.inc.php" method="post">
        <input type="text" name="username_or_email" placeholder="Username or E-mail">
        <input type="password" name="password" placeholder="Password">
        <button>Log in</button>
    </form>

</body>
</html>