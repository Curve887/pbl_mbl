<?php
header("Content-Type: application/json");

$host = "localhost";
$username = "root";
$password = "";
$database = "db_miyang";

try {
    $conn = new PDO("mysql:host=$host;dbname=$database", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Pesan sukses jika koneksi berhasil
} catch (PDOException $e) {
    // Pesan jika koneksi gagal
    echo json_encode(["status" => "error", "message" => "Connection failed: " . $e->getMessage()]);
    exit();
}
?>
