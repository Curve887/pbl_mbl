<?php
header("Content-Type: application/json");
require_once "db.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Ambil data JSON dari request
    $data = json_decode(file_get_contents("php://input"), true);

    // Validasi Input: pastikan email dan password tidak kosong
    if (empty($data['email']) || empty($data['password'])) {
        echo json_encode(["status" => "error", "message" => "Email dan password harus diisi!"]);
        exit();
    }

    $email = htmlspecialchars($data['email']);
    $password = $data['password'];

    try {
        // Ambil data pengguna berdasarkan email
        $stmt = $conn->prepare("SELECT * FROM users WHERE email = :email");
        $stmt->execute(['email' => $email]);

        // Cek apakah pengguna ditemukan
        if ($stmt->rowCount() == 0) {
            echo json_encode(["status" => "error", "message" => "Pengguna tidak ditemukan!"]);
            exit();
        }

        // Ambil data pengguna dari hasil query
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verifikasi password menggunakan password_hash yang tersimpan di database
        if (password_verify($password, $user['password'])) {
            echo json_encode([
                "status" => "success",
                "message" => "Login berhasil!",
                "data" => [ 
                    "id" => $user['id'],
                    "username" => $user['username'],
                    "email" => $user['email']
                ]
            ]);
        } else {
            echo json_encode(["status" => "error", "message" => "Password salah!"]);
        }
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Login gagal: " . $e->getMessage()]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Metode tidak diizinkan!"]);
}
?>
