<?php

require_once '../config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username_or_email = $_POST["username_or_email"];
    $password = $_POST["password"];
    if (empty($_POST["username_or_email"]) || empty($_POST["password"])) {
        header("Location: ../login.php?error=empty_fields");
        exit() ;
    }

    try {
        require_once "dbh.inc.php";
        
        $query = "SELECT * FROM user WHERE (Username = :username_or_email OR Email = :username_or_email) AND Password = :password;";

        $stmt = $pdo->prepare($query);
        
        $stmt->bindParam(":username_or_email", $username_or_email);
        $stmt->bindParam(":password", $password);

        $stmt->execute();

        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result) {
            $_SESSION['user_id'] = $result['UserID']; 
            session_start();
            header("Location: ../index.php");
            exit(); 
        } else {
            header("Location: ../login.php?error=incorrect_credentials");
            exit();
        }

    } catch (PDOException  $e) {
        die("Query failed: " . $e->getMessage());
    } finally {
        $pdo = null;
        $stmt = null;
    }
} else {
    header("Location: ../login.php");
    exit();
}
