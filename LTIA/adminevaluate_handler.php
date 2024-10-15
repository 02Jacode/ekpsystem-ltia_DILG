<?php
session_start();

include '../connection.php'; // Ensure this file is using a PDO connection

if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'admin') {
    header("Location: ../login.php");
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $mov_id = $_POST['mov_id'] ?? null;
    $barangay_id = $_POST['barangay_id'] ?? null;

    // Collect all rates and remarks (allow null)
    $rates = [
        'IA_1a_pdf_rate', 'IA_1b_pdf_rate', 'IA_2a_pdf_rate', 'IA_2b_pdf_rate', 'IA_2c_pdf_rate', 'IA_2d_pdf_rate', 'IA_2e_pdf_rate',
        'IB_1forcities_pdf_rate', 'IB_1aformuni_pdf_rate', 'IB_1bformuni_pdf_rate', 'IB_2_pdf_rate', 'IB_3_pdf_rate', 'IB_4_pdf_rate',
        'IC_1_pdf_rate', 'IC_2_pdf_rate', 'ID_1_pdf_rate', 'ID_2_pdf_rate', 'IIA_pdf_rate', 'IIB_1_pdf_rate', 'IIB_2_pdf_rate',
        'IIC_pdf_rate', 'IIIA_pdf_rate', 'IIIB_pdf_rate', 'IIIC_1forcities_pdf_rate', 'IIIC_1forcities2_pdf_rate',
        'IIIC_1forcities3_pdf_rate', 'IIIC_2formuni1_pdf_rate', 'IIIC_2formuni2_pdf_rate', 'IIIC_2formuni3_pdf_rate',
        'IIID_pdf_rate', 'IV_forcities_pdf_rate', 'IV_muni_pdf_rate', 'V_1_pdf_rate', 'threepeoplesorg_rate', 'total'
    ];

    $remarks = [
        'IA_1a_pdf_remark', 'IA_1b_pdf_remark', 'IA_2a_pdf_remark', 'IA_2b_pdf_remark', 'IA_2c_pdf_remark', 'IA_2d_pdf_remark',
        'IA_2e_pdf_remark', 'IB_1forcities_pdf_remark', 'IB_1aformuni_pdf_remark', 'IB_1bformuni_pdf_remark', 'IB_2_pdf_remark',
        'IB_3_pdf_remark', 'IB_4_pdf_remark', 'IC_1_pdf_remark', 'IC_2_pdf_remark', 'ID_1_pdf_remark', 'ID_2_pdf_remark',
        'IIA_pdf_remark', 'IIB_1_pdf_remark', 'IIB_2_pdf_remark', 'IIC_pdf_remark', 'IIIA_pdf_remark', 'IIIB_pdf_remark',
        'IIIC_1forcities_pdf_remark', 'IIIC_1forcities2_pdf_remark', 'IIIC_1forcities3_pdf_remark', 'IIIC_2formuni1_pdf_remark',
        'IIIC_2formuni2_pdf_remark', 'IIIC_2formuni3_pdf_remark', 'IIID_pdf_rate_remark', 'IV_forcities_pdf_remark',
        'IV_muni_pdf_remark', 'V_1_pdf_remark', 'threepeoplesorg_remark'
    ];

    // Validate required fields
    if (!$mov_id || !$barangay_id) {
        echo "Missing required values.";
        exit;
    }

    try {
        // Start transaction
        $conn->beginTransaction();

        // Prepare `movrate` insert query
        $movrate_query = "INSERT INTO `movrate` 
            (`barangay`, `mov_id`, " . implode(", ", $rates) . ")
            VALUES (:barangay, :mov_id, " . implode(", ", array_map(fn($r) => ':' . $r, $rates)) . ")";

        $stmt = $conn->prepare($movrate_query);

        // Bind barangay and mov_id
        $stmt->bindParam(':barangay', $barangay_id, PDO::PARAM_INT);
        $stmt->bindParam(':mov_id', $mov_id, PDO::PARAM_INT);

        // Bind all rates (allow null values)
        foreach ($rates as $rate) {
            $value = $_POST[$rate] ?? null;
            // Handle null and non-null values properly
            $stmt->bindValue(':' . $rate, $value === '' || $value === null ? null : $value, $value === '' || $value === null ? PDO::PARAM_NULL : PDO::PARAM_STR);
        }

        $stmt->execute();

        // Prepare `movremark` insert query
        $movremark_query = "INSERT INTO `movremark` 
            (`barangay`, `mov_id`, " . implode(", ", $remarks) . ")
            VALUES (:barangay, :mov_id, " . implode(", ", array_map(fn($r) => ':' . $r, $remarks)) . ")";

        $stmt = $conn->prepare($movremark_query);

        // Bind barangay and mov_id for remarks
        $stmt->bindParam(':barangay', $barangay_id, PDO::PARAM_INT);
        $stmt->bindParam(':mov_id', $mov_id, PDO::PARAM_INT);

        // Bind all remarks (allow null values)
        foreach ($remarks as $remark) {
            $value = $_POST[$remark] ?? null;
            // Handle null and non-null values properly
            $stmt->bindValue(':' . $remark, $value === '' || $value === null ? null : $value, $value === '' || $value === null ? PDO::PARAM_NULL : PDO::PARAM_STR);
        }

        $stmt->execute();

        // Commit the transaction
        $conn->commit();
        echo "Data inserted successfully.";

    } catch (Exception $e) {
        // Rollback the transaction in case of error
        $conn->rollBack();
        echo "Failed to insert data: " . $e->getMessage();
    }
}
?>
