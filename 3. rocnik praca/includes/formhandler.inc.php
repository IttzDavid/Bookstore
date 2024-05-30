<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $surname = $_POST["surname"];
    $username = $_POST["username"];
    $password = $_POST["passwd"];
    $email = $_POST["email"];
    $age = $_POST["age"];
    $date_of_birth = $_POST["dateofbirth"];
    $country = $_POST["country"];

    try {
        require_once "dbh.inc.php";

        $query = "INSERT INTO user (Name, Surname, Username, Password, Email, Age, DateOfBirth, Country) VALUES (:name, :surname, :username, :password, :email, :age, :dob , :country);";

        $stmt = $pdo->prepare($query);

        $stmt->bindParam(":name", $name);
        $stmt->bindParam(":surname", $surname);
        $stmt->bindParam(":username", $username);
        $stmt->bindParam(":password", $password);
        $stmt->bindParam(":email", $email);
        $stmt->bindParam(":age", $age);
        $stmt->bindParam(":dob", $date_of_birth);
        $stmt->bindParam(":country", $country);

        $stmt->execute();

        $pdo = null;
        $stmt = null;

        header("Location: ../index.php");

        die();

    } catch (PDOException  $e) {
        die("Query failed: " . $e->getMessage());
    }
} 
else {
    header("Location: ../index.php");
}