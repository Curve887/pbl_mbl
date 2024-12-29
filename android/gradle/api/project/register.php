<?php
header("Content-Type: application/json");
require_once "db.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Untuk x-www-form-urlencoded, kita menggunakan $_POST
    $username = isset($_POST['username']) ? htmlspecialchars($_POST['username']) : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
    $password = isset($_POST['password']) ? htmlspecialchars($_POST['password']) : '';

    // Validasi Input: Semua kolom harus ada dan tidak boleh kosong
    if (empty($username) || empty($email) || empty($password)) {
        echo json_encode(["status" => "error", "message" => "Semua kolom harus diisi!"]);
        exit();
    }

    // Hash password
    $password = password_hash($password, PASSWORD_BCRYPT);

    try {
        // Periksa jika email atau username sudah ada
        $stmt = $conn->prepare("SELECT * FROM users WHERE email = :email OR username = :username");
        $stmt->execute(['email' => $email, 'username' => $username]);
        
        if ($stmt->rowCount() > 0) {
            echo json_encode(["status" => "error", "message" => "Username atau email sudah digunakan!"]);
            exit();
        }

        // Insert data pengguna baru
        $stmt = $conn->prepare("INSERT INTO users (username, email, password) VALUES (:username, :email, :password)");
        $stmt->execute(['username' => $username, 'email' => $email, 'password' => $password]);

        echo json_encode(["status" => "success", "message" => "Registrasi berhasil!"]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Gagal mendaftarkan pengguna: " . $e->getMessage()]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Metode tidak diizinkan!"]);
}
?>
