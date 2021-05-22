<?php
require_once('../config/autoload.php');
require_once('./includes/path.inc.php');
ob_start();

$errors = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $fname       = escape_input($_POST['inputFirstName']);
    $lname       = escape_input($_POST['inputLastName']);
    $years      = escape_input($_POST['inputYrsExp']);
    $email      = escape_input($_POST['inputEmailAddress']);
    $contact    = escape_input($_POST['inputContactNumber']);
    $password = $conn->real_escape_string($_POST['inputPassword']);
    $con_pass = $conn->real_escape_string($_POST['inputConfirmPassword']);
    if (isset($_POST['inputSpeciality'])) {
        $speciality = escape_input($_POST['inputSpeciality']);
    }
    if (isset($_POST['inputGender'])) {
        $gender     = escape_input($_POST['inputGender']);
    }
    if (empty($fname)) {
        $errFName = $error_html['errFirstName'];
        $classFName = $error_html['errClass'];
    } else {
        if (!preg_match($regrex['text'], $fname)) {
            $errFName = $error_html['invalidText'];
            $classFName = $error_html['errClass'];
        }
    }
    if (empty($lname)) {
        $errLName = $error_html['errLastName'];
        $classLName = $error_html['errClass'];
    } else {
        if (!preg_match($regrex['text'], $lname)) {
            $errFName = $error_html['invalidText'];
            $classFName = $error_html['errClass'];
        }
    }
    if (empty($speciality)) {
        $errSpec = $error_html['errSpec'];
        $classSpec = $error_html['errClass'];
    }
    if (empty($years)) {
        $errYears = $error_html['errYears'];
        $classYears = $error_html['errClass'];
    } else {
        if (!filter_var($years, FILTER_VALIDATE_INT)) {
            $errYears = $error_html['invalidInt'];
            $classYears = $error_html['errClass'];
        }
    }
    if (empty($gender)) {
        $errGender = $error_html['errGender'];
        $classGender = $error_html['errClass'];
    }

    if (empty($email)) {
        $errEmail = $error_html['errEmail'];
        $classEmail = $error_html['errClass'];
    } else {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $errEmail =  $error_html['invalidEmail'];
            $classEmail = $error_html['errClass'];
        }
    }

    if (empty($contact)) {
        $errContact = $error_html['errContact'];
        $classContact = $error_html['errClass'];
    } else {
        if (!preg_match($regrex['contact'], $contact)) {
            $errContact = $error_html['invalidInt'];
            $classContact = $error_html['errClass'];
        }
    }
    if (empty($password)) {
        $errPassword = $error_html['errPassword'];
        $classPassword = $error_html['errClass'];
    } elseif ($password != $con_pass) {
        $errConfirmPassword = $error_html['errConfirmPassword'];
        $classConfirmPassword = $error_html['errClass'];
    } else {
        password_validation($password);
    }

    if (empty($con_pass)) {
        $errConfirmPassword = $error_html['errConfirmPassword'];
        $classConfirmPassword = $error_html['errClass'];
    }
}
?>
<!DOCTYPE html>
<html>

<head>
    <?php include CSS_PATH; ?>
    <link rel="stylesheet" href="../assets/css/login.css">
</head>

<body>
    <div class="container">
        <div class="login-wrap mx-auto">
            <div class="login-head">
                <h4><?php echo $BRAND_NAME; ?></h4>
                <p>Create an Account! Manage Your Clinic</p>
            </div>
            <div class="login-body">
                <form name="login_form" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                    <?php echo display_error(); ?>
                    <div class="form-row mb-2">
                        <div class="form-group col-md-6">
                            <label for="inputFirstName">First Name</label>
                            <input type="text" name="inputFirstName" class="form-control <?php echo $classFName ?>" id="inputFirstName" placeholder="Enter First Name">
                            <?php echo $errFName; ?>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputLastName">Last Name/Surname</label>
                            <input type="text" name="inputLastName" class="form-control <?php echo $classFName ?>" id="inputLastName" placeholder="Enter Last Name">
                            <?php echo $errLName; ?>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputEmailAddress">Email Address</label>
                        <input type="text" name="inputEmailAddress" class="form-control <?= $classEmail ?>" id="inputEmailAddress" placeholder="Enter Email Address">
                        <?= $errEmail ?>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputSpeciality">Speciality</label>
                            <select name="inputSpeciality" id="inputSpeciality" class="form-control selectpicker <?= $classSpec ?>" data-live-search="true">
                                <option value="" selected disabled>Choose</option>
                                <?php
                                $table_result = mysqli_query($conn, "SELECT * FROM speciality");
                                while ($table_row = mysqli_fetch_assoc($table_result)) {
                                    echo '<option value="' . $table_row["speciality_id"] . '">' . $table_row["speciality_name"] . '</option>';
                                }
                                ?>
                            </select>
                            <?= $errSpec ?>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputContactNumber">Contact Number</label>
                            <input type="text" name="inputContactNumber" class="form-control <?= $classContact ?>" id="inputContactNumber" placeholder="Enter Phone Number">
                            <?= $errContact ?>
                        </div>
                    </div>
                    <div class="form-row mb-2">
                        <div class="form-group col-md-6">
                            <label for="inputGender">Gender</label>



                            <div class="row">
                                <div class="col">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="inputGenderMale" name="inputGender" class="custom-control-input <?= $classGender ?>" value="male">
                                        <label class="custom-control-label" for="inputGenderMale">Male</label>

                                    </div>
                                </div>
                                <div class="col">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" id="inputGenderFemale" name="inputGender" class="custom-control-input <?= $classGender ?>" value="female">
                                        <label class="custom-control-label" for="inputGenderFemale">Female</label>

                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputYrsExp">Year Experience</label>
                            <input type="text" name="inputYrsExp" class="form-control <?= $classYears ?>" id="inputYrsExp" placeholder="Enter Years Experience">
                            <?= $errYears ?>
                        </div>
                    </div>
                    <div class="form-row mb-2">
                        <div class="form-group col-md-6">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" name="inputPassword" class="form-control   <?= $classPassword ?>" id="inputPassword" placeholder="Enter Password" data-toggle="popover" data-placement="left" data-content="Password must contain at least 8 characters, including UPPERCASE, lowercase and numbers">
                            <?= $errPassword ?>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="exampleInputPassword1">Confirm Password</label>
                            <input type="password" name="inputConfirmPassword" class="form-control   <?= $classConfirmPassword ?>" id="inputConfirmPassword" placeholder="Re-enter Password">
                            <?= $errConfirmPassword ?>
                        </div>
                    </div>
                    <button type="submit" name="registerbtn" class="btn btn-primary btn-block button">Create an Account</button>
                </form>
            </div>
            <div class="login-footer">
                <p class="text-muted">Already have an account? <a href="login.php">Sign In</a></p>
            </div>
        </div>
    </div>
    <?php include JS_PATH; ?>
    <script>
        $(document).ready(function() {
            $('[data-toggle="popover"]').popover();
        });

        $('#inputGender').on('keyup', function() {
            var input = $(this).val(),
                lastnum = input % 10;
            if (lastnum % 2 === 0) {
                $("#inputGenderFemale").prop("checked", true);
            } else {
                $("#inputGenderMale").prop("checked", true);
            }
        });
    </script>
</body>

</html>
<?php
if (isset($_POST['registerbtn'])) {
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    if (multi_empty($errFName, $errLName,  $errYears,  $errGender, $errEmail, $errContact)) {
        $business_name=$fname. " ".$lname;

        $btmt = $conn->prepare("INSERT INTO business (business_name, date_created) VALUES (?, ?)");


        $btmt->bind_param("ss", $business_name, $date_created);
        $last_id =0;
        if ($btmt->execute()) {
            $last_id = mysqli_insert_id($conn);
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
        $btmt->close();
     

        $token = generateCode(22);
        $en_pass = encrypt(md5($password), $token);
        // print_r( $fname."     ". $lname."     ". $en_pass."     ". $speciality."     ". $years."     ". $gender."     ".  $email."     ". $contact."     ". $date_created."     ".$last_id);
        // $stmt = $conn->prepare("INSERT INTO doctors ( doctor_firstname, doctor_lastname, doctor_password,doctor_speciality, doctor_experience, doctor_gender, doctor_email, doctor_contact,date_created,clinic_id,business_id) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
        // $stmt->bind_param("sssisssssii",  $fname, $lname, $en_pass, $speciality, $years, $gender,  $email, $contact, $date_created,0,$last_id);
        $stmt = $conn->prepare("INSERT INTO doctors ( doctor_firstname, doctor_lastname,doctor_password,doctor_speciality, doctor_experience, doctor_gender,doctor_email, doctor_contact,date_created, business_id) VALUES (?,?,?,?,?,?,?,?,?,?)");
        $stmt->bind_param("sssisssssi",  $fname, $lname,$en_pass, $speciality, $years, $gender,  $email,$contact, $date_created,$last_id);

     

        $weekstmt = $conn->prepare("INSERT INTO appointment_hour (business_id) VALUES (?)");
        $weekstmt->bind_param("i", $last_id);

        if ($stmt->execute() && $weekstmt->execute()) {
            echo '<script>
            Swal.fire({ title: "Great!", text: " You have been registered successfully! Wait for the verification.", type: "success" });
            </script>';
            $_SESSION['DoctorRoleID'] = $row['doctor_id'];
            $_SESSION['business_id'] = $row['business_id'];
			$_SESSION['DoctorRoleEmail'] = $row['doctor_email'];
			$_SESSION['DoctorRoleLoggedIn'] = 1;
      
            header("Location: doctor-register.php");
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }

        $stmt->close();
        $weekstmt->close();
    }
}
?>