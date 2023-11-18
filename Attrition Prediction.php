<?php
# *****************************************************************************

// STEP 1: Set the API endpoint URL
$apiUrl = 'http://127.0.0.1:5022/Attrition';

// Initiate a new cURL session/resource
$curl = curl_init();

// STEP 2: Set the values of the parameters to pass to the model ----

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve the form data
    $arg_Age = $_POST["arg_Age"];
    $arg_BusinessTravel = $_POST["arg_BusinessTravel"];
    $arg_DailyRate = $_POST["arg_DailyRate"];
    $arg_Department = $_POST["arg_Department"];
    $arg_DistanceFromHome = $_POST["arg_DistanceFromHome"];
    $arg_Education = $_POST["arg_Education"];
    $arg_EducationField = $_POST["arg_EducationField"];
    $arg_EnvironmentSatisfaction = $_POST["arg_EnvironmentSatisfaction"];
    $arg_Gender = $_POST["arg_Gender"];
    $arg_HourlyRate = $_POST["arg_HourlyRate"];
    $arg_JobInvolvement = $_POST["arg_JobInvolvement"];
    $arg_JobLevel = $_POST["arg_JobLevel"];
    $arg_JobRole = $_POST["arg_JobRole"];
    $arg_JobSatisfaction = $_POST["arg_JobSatisfaction"];
    $arg_MaritalStatus = $_POST["arg_MaritalStatus"];
    $arg_MonthlyIncome = $_POST["arg_MonthlyIncome"];
    $arg_MonthlyRate = $_POST["arg_MonthlyRate"];
    $arg_NumCompaniesWorked = $_POST["arg_NumCompaniesWorked"];
    $arg_OverTime = $_POST["arg_OverTime"];
    $arg_PercentSalaryHike = $_POST["arg_PercentSalaryHike"];
    $arg_PerformanceRating = $_POST["arg_PerformanceRating"];
    $arg_RelationshipSatisfaction = $_POST["arg_RelationshipSatisfaction"];
    $arg_StockOptionLevel = $_POST["arg_StockOptionLevel"];
    $arg_TotalWorkingYears = $_POST["arg_TotalWorkingYears"];
    $arg_TrainingTimesLastYear = $_POST["arg_TrainingTimesLastYear"];
    $arg_WorkLifeBalance = $_POST["arg_WorkLifeBalance"];
    $arg_YearsAtCompany = $_POST["arg_YearsAtCompany"];
    $arg_YearsInCurrentRole = $_POST["arg_YearsInCurrentRole"];
    $arg_YearsSinceLastPromotion = $_POST["arg_YearsSinceLastPromotion"];
    $arg_YearsWithCurrManager = $_POST["arg_YearsWithCurrManager"];

    // Update the cURL parameters
$params = array(
    'arg_Age' => $arg_Age,
    'arg_BusinessTravel' => $arg_BusinessTravel,
    'arg_DailyRate' => $arg_DailyRate,
    'arg_Department' => $arg_Department,
    'arg_DistanceFromHome' => $arg_DistanceFromHome,
    'arg_Education' => $arg_Education,
    'arg_EducationField' => $arg_EducationField,
    'arg_EnvironmentSatisfaction' => $arg_EnvironmentSatisfaction,
    'arg_Gender' => $arg_Gender,
    'arg_HourlyRate' => $arg_HourlyRate,
    'arg_JobInvolvement' => $arg_JobInvolvement,
    'arg_JobLevel' => $arg_JobLevel,
    'arg_JobRole' => $arg_JobRole,
    'arg_JobSatisfaction' => $arg_JobSatisfaction,
    'arg_MaritalStatus' => $arg_MaritalStatus,
    'arg_MonthlyIncome' => $arg_MonthlyIncome,
    'arg_MonthlyRate' => $arg_MonthlyRate,
    'arg_NumCompaniesWorked' => $arg_NumCompaniesWorked,
    'arg_OverTime' => $arg_OverTime,
    'arg_PercentSalaryHike' => $arg_PercentSalaryHike,
    'arg_PerformanceRating' => $arg_PerformanceRating,
    'arg_RelationshipSatisfaction' => $arg_RelationshipSatisfaction,
    'arg_StockOptionLevel' => $arg_StockOptionLevel,
    'arg_TotalWorkingYears' => $arg_TotalWorkingYears,
    'arg_TrainingTimesLastYear' => $arg_TrainingTimesLastYear,
    'arg_WorkLifeBalance' => $arg_WorkLifeBalance,
    'arg_YearsAtCompany' => $arg_YearsAtCompany,
    'arg_YearsInCurrentRole' => $arg_YearsInCurrentRole,
    'arg_YearsSinceLastPromotion' => $arg_YearsSinceLastPromotion,
    'arg_YearsWithCurrManager' => $arg_YearsWithCurrManager
);


    // Set the cURL options
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    $apiUrl = $apiUrl . '?' . http_build_query($params);
    curl_setopt($curl, CURLOPT_URL, $apiUrl);

    // For testing:
    // echo "The generated URL sent to the API is:<br>" . $apiUrl . "<br><br>";

    // Make a GET request
    $response = curl_exec($curl);

    // Check for cURL errors
    if (curl_errno($curl)) {
        $error = curl_error($curl);
        // Handle the error appropriately
        die("cURL Error: $error");
    }

    // Close cURL session/resource
    curl_close($curl);

    // Process the response
    $data = json_decode($response, true);

    // Check if the response was successful
    if (isset($data['0'])) {
        // API request was successful
        // Access the data returned by the API
        $predictedType = "The predicted Attrition is: ";

        // Process the data
        foreach ($data as $repository) {
            $predictedType .= $repository['0'] . $repository['1'] ."<br>";
        }
    } else {
        // API request failed or returned an error
        // Handle the error appropriately
        $predictedType = "API Error: " . $data['message'];
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attrition Prediction</title>
    <style>
       body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://source.unsplash.com/1920x1080/?employees'); /* Replace with the actual URL for employees' images */
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            
            color: white;
        }

        h1 {
            
            color: goldenrod;
            margin-bottom: 2500px;
            margin-left: 100px;

        }
        
        h3 {
            text-align: center;
            color: black;
            
            
        }

        form {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            margin: auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-right: 200px;
        }

        .form-row {
            display: flex;
            flex-direction: column;
            width: 20%;
            margin-bottom: 10px;
        }
        form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            appearance: none; /* Remove default arrow icon in some browsers */
            background-color: #fff; /* Set background color */
            border: 1px solid #ccc; /* Add border */
            border-radius: 4px; /* Optional: Add border-radius for rounded corners */
            color: #555; /* Set text color */
            cursor: pointer;
        }

        select:hover,
        select:focus {
            border-color: #333; /* Change border color on hover/focus */
        }
    </style>
    <h1>Attrition</h1>
</head>


<body>
    
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <!-- Age -->
        <label for="arg_Age">Age:</label>
        <input type="text" name="arg_Age" required><br>

        <!-- Business Travel -->
        <label for="arg_BusinessTravel">Business Travel Frequency:</label>
        <select name="arg_BusinessTravel" required>
            <option value="Travel_Rarely">Travel Rarely</option>
            <option value="Travel_Frequently">Travel Frequently</option>
            <option value="Non-Travel">Non-Travel</option>
        </select><br>

        <!-- Daily Rate -->
        <label for="arg_DailyRate">Daily Rate:</label>
        <input type="text" name="arg_DailyRate" required><br>

        <!-- Department -->
        <label for="arg_Department">Department:</label>
        <select name="arg_Department" required>
            <option value="Sales">Sales</option>
            <option value="Research & Development">Research & Development</option>
        </select><br>

        <!-- Distance From Home -->
        <label for="arg_DistanceFromHome">Distance From Home:</label>
        <input type="text" name="arg_DistanceFromHome" required><br>

        <!-- Education -->
        <label for="arg_Education">Education: ie (1-5)</label>
        <input type="text" name="arg_Education" required><br>

        <!-- Education Field -->
        <label for="arg_EducationField">Field of Education:</label>
        <select name="arg_EducationField" required>
            <option value="Medical">Medical</option>
            <option value="Life Sciences">Life Sciences</option>
            <option value="Others">Others</option>
            <option value="Marketing">Marketing</option>
            <option value="Technical Degree">Technical Degree</option>
            <option value="Human Resource">Human Resource</option>
        </select><br>

        <!-- Environment Satisfaction -->
        <label for="arg_EnvironmentSatisfaction">Environment Satisfaction: ie (1-5)</label>
        <input type="text" name="arg_EnvironmentSatisfaction" required><br>

        <!-- Gender -->
        <label for="arg_Gender">Gender:</label>
        <select type="text" name="arg_Gender" required>
        <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select><br> <br>

        <!-- Hourly Rate -->
        <label for="arg_HourlyRate">Hourly Rate: ie (1-100)</label>
        <input type="text" name="arg_HourlyRate" required><br>

        <!-- Job Involvement -->
        <label for="arg_JobInvolvement">Job Involvement: ie (1-5)</label>
        <input type="text" name="arg_JobInvolvement" required><br>

        <!-- Job Level -->
        <label for="arg_JobLevel">Job Level: ie (1-5)</label>
        <input type="text" name="arg_JobLevel" required><br>

        <!-- Job Role -->
        <label for="arg_JobRole">Employee's Job Role:</label>
        <select name="arg_JobRole" required>
            <option value="Sales Executive">Sales Executive</option>
            <option value="Laboratory Technician">Laboratory Technician</option>
            <option value="Research Scientist">Research Scientist</option>
            <option value="Sales Representative">Sales Representative</option>
            <option value="Manufacturing Director">Manufacturing Director</option>
            <option value="Healthcare Representative">Healthcare Representative</option>
            <option value="Manager">Manager</option>
            <option value="Human Resources">Human Resources</option>
        </select><br>

        <!-- Job Satisfaction -->
        <label for="arg_JobSatisfaction">Job Satisfaction: ie (1-5)</label>
        <input type="text" name="arg_JobSatisfaction" required><br>

        <!-- Marital Status -->
        <label for="arg_MaritalStatus">Employee's Marital Status:</label>
        <select name="arg_MaritalStatus" required>
            <option value="Single">Single</option>
            <option value="Married">Married</option>
            <option value="Divorced">Divorced</option>
        </select><br>

        <!-- Monthly Income -->
        <label for="arg_MonthlyIncome">Monthly Income:ie (1- ~)</label>
        <input type="text" name="arg_MonthlyIncome" required><br>

        <!-- Monthly Rate -->
        <label for="arg_MonthlyRate">Monthly Rate: ie (1-~)</label>
        <input type="text" name="arg_MonthlyRate" required><br>

        <!-- Num Companies Worked -->
        <label for="arg_NumCompaniesWorked">Number Companies Worked: ie (1-20)</label>
        <input type="text" name="arg_NumCompaniesWorked" required><br>

        <!-- OverTime -->
        <label for="arg_OverTime">Does the employee work overtime?</label>
        <select name="arg_OverTime" required>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
        </select><br>

        <!-- Percent Salary Hike -->
        <label for="arg_PercentSalaryHike">Percent Salary Hike: ie (1-100)</label>
        <input type="text" name="arg_PercentSalaryHike" required><br>

        <!-- Performance Rating -->
        <label for="arg_PerformanceRating">Performance Rating: ie (1-5)</label>
        <input type="text" name="arg_PerformanceRating" required><br>

        <!-- Relationship Satisfaction -->
        <label for="arg_RelationshipSatisfaction">Relationship Satisfaction: ie (1-5)</label>
        <input type="text" name="arg_RelationshipSatisfaction" required><br>

        <!-- Stock Option Level -->
        <label for="arg_StockOptionLevel">Stock Option Level: ie (1-5)</label>
        <input type="text" name="arg_StockOptionLevel" required><br>

        <!-- Total Working Years -->
        <label for="arg_TotalWorkingYears">Total Working Years: ie (1-70)</label>
        <input type="text" name="arg_TotalWorkingYears" required><br>

        <!-- Training Times Last Year -->
        <label for="arg_TrainingTimesLastYear">Training Times Last Year: ie (1-7)</label>
        <input type="text" name="arg_TrainingTimesLastYear" required><br>

        <!-- Work Life Balance -->
        <label for="arg_WorkLifeBalance">Work Life Balance: ie (1-5)</label>
        <input type="text" name="arg_WorkLifeBalance" required><br>

        <!-- Years At Company -->
        <label for="arg_YearsAtCompany">Years At Company: ie (1-70)</label>
        <input type="text" name="arg_YearsAtCompany" required><br>

        <!-- Years In Current Role -->
        <label for="arg_YearsInCurrentRole">Years In Current Role: ie (1-70)</label>
        <input type="text" name="arg_YearsInCurrentRole" required><br>

        <!-- Years Since Last Promotion -->
        <label for="arg_YearsSinceLastPromotion">Years Since Last Promotion: ie (1-15)</label>
        <input type="text" name="arg_YearsSinceLastPromotion" required><br>

        <!-- Years With Curr Manager -->
        <label for="arg_YearsWithCurrManager">Years With Curr Manager: ie (1-30)</label>
        <input type="text" name="arg_YearsWithCurrManager" required><br>


        <br>
        <input type="submit" value="Submit">

        <?php
// Display the predicted soil type
if (!empty($predictedType)) {
    echo '<h3>' . $predictedType . '</h3>';
}
?>
    </form>
</body>
</html>



