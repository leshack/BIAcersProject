<?php
# *****************************************************************************

// STEP 1: Set the API endpoint URL
$apiUrl = 'http://127.0.0.1:5022/Attrition';

// // Database credentials
// $dbservername = "localhost";
// $dbusername = "root";
// $dbpassword = "";
// $dbname = "employee_attrition";


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

   

    // Function to save data to the database
function saveToDatabase($params, $predictedType)
{
    // Establish a database connection (replace with your database credentials)
    $mysqli = new mysqli("localhost", "root", "", "employee_attrition");

    // Check connection
    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }

    // Prepare the SQL statement
    $stmt = $mysqli->prepare("INSERT INTO employee_customerfacing_data (
        Age, BusinessTravel, DailyRate, Department, DistanceFromHome, Education, 
        EducationField, EnvironmentSatisfaction, Gender, HourlyRate, JobInvolvement, 
        JobLevel, JobRole, JobSatisfaction, MaritalStatus, MonthlyIncome, MonthlyRate, 
        NumCompaniesWorked, OverTime, PercentSalaryHike, PerformanceRating, 
        RelationshipSatisfaction, StockOptionLevel, TotalWorkingYears, 
        TrainingTimesLastYear, WorkLifeBalance, YearsAtCompany, YearsInCurrentRole, 
        YearsSinceLastPromotion, YearsWithCurrManager, PredictedAttrition
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    // Bind parameters
    $stmt->bind_param("isisiisisiiisisiiisiiiiiiiiiiis", 
        $params['arg_Age'], $params['arg_BusinessTravel'], $params['arg_DailyRate'], 
        $params['arg_Department'], $params['arg_DistanceFromHome'], $params['arg_Education'], 
        $params['arg_EducationField'], $params['arg_EnvironmentSatisfaction'], $params['arg_Gender'], 
        $params['arg_HourlyRate'], $params['arg_JobInvolvement'], $params['arg_JobLevel'], 
        $params['arg_JobRole'], $params['arg_JobSatisfaction'], $params['arg_MaritalStatus'], 
        $params['arg_MonthlyIncome'], $params['arg_MonthlyRate'], $params['arg_NumCompaniesWorked'], 
        $params['arg_OverTime'], $params['arg_PercentSalaryHike'], $params['arg_PerformanceRating'], 
        $params['arg_RelationshipSatisfaction'], $params['arg_StockOptionLevel'], $params['arg_TotalWorkingYears'], 
        $params['arg_TrainingTimesLastYear'], $params['arg_WorkLifeBalance'], $params['arg_YearsAtCompany'], 
        $params['arg_YearsInCurrentRole'], $params['arg_YearsSinceLastPromotion'], 
        $params['arg_YearsWithCurrManager'], $predictedType);

    // Execute the statement
    $stmt->execute();

    // Close the statement and connection
    $stmt->close();
    $mysqli->close();
}

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
        $predictedType = "";
    
        // Process the data
        foreach ($data as $repository) {
            // Check if each index exists before concatenating
            if (isset($repository[0])) {
                $predictedType .= $repository[0];
            }
            if (isset($repository[1])) {
                $predictedType .= $repository[1];
            }
            if (isset($repository[2])) {
                $predictedType .= $repository[2];
            }
    
            // Save to the database
            saveToDatabase($params, $predictedType);
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-rough@1.0.0/dist/chartjs-plugin-rough.min.js"></script>
    <!-- Include D3.js from CDN -->
<script src="https://d3js.org/d3.v7.min.js"></script>
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
            margin-left: 400px;
            font-weight: bold;
        }

        h2 {
            text-align: center;
            color: black;
            font-weight: bold;
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
            margin-bottom: 10px;
        }

        label {
            color: white;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1 class="mb-5">Attrition Prediction</h1>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <div class="col-md-3 row">
            <!-- Age -->
            <div class="mb-3 form-row">
                <label for="arg_Age" class="form-label">Age:</label>
                <input type="text" name="arg_Age" class="form-control" required>
            </div>

            <!-- Business Travel -->
            <div class="mb-3 form-row">
                <label for="arg_BusinessTravel" class="form-label">Business Travel Frequency:</label>
                <select name="arg_BusinessTravel" class="form-select" required>
                    <option value="Travel_Rarely">Travel Rarely</option>
                    <option value="Travel_Frequently">Travel Frequently</option>
                    <option value="Non-Travel">Non-Travel</option>
                </select>
            </div>
        

            <!-- Daily Rate -->
            <div class="mb-3 form-row">
                <label for="arg_DailyRate" class="form-label">Daily Rate:</label>
                <input type="text" name="arg_DailyRate" class="form-control" required>
            </div>

            <!-- Department -->
            <div class="mb-3 form-row">
                <label for="arg_Department" class="form-label">Department:</label>
                <select name="arg_Department" class="form-select" required>
                    <option value="Sales">Sales</option>
                    <option value="Research & Development">Research & Development</option>
                </select>
            </div>

            <!-- Distance From Home -->
            <div class="mb-3 form-row">
                <label for="arg_DistanceFromHome" class="form-label">Distance From Home:</label>
                <input type="text" name="arg_DistanceFromHome" class="form-control" required>
            </div>

            <!-- Education -->
            <div class="mb-3 form-row">
                <label for="arg_Education" class="form-label">Education: ie (1-5)</label>
                <input type="text" name="arg_Education" class="form-control" required>
            </div>

            <!-- Education Field -->
            <div class="mb-3 form-row">
                <label for="arg_EducationField" class="form-label">Field of Education:</label>
                <select name="arg_EducationField" class="form-select" required>
                    <option value="Medical">Medical</option>
                    <option value="Life Sciences">Life Sciences</option>
                    <option value="Others">Others</option>
                    <option value="Marketing">Marketing</option>
                    <option value="Technical Degree">Technical Degree</option>
                    <option value="Human Resource">Human Resource</option>
                </select>
            </div>
            </div>

            <div class="col-md-3 row">
            <!-- Environment Satisfaction -->
            <div class="mb-3 form-row">
                <label for="arg_EnvironmentSatisfaction" class="form-label">Environment Satisfaction: ie (1-5)</label>
                <input type="text" name="arg_EnvironmentSatisfaction" class="form-control" required>
            </div>

            <!-- Gender -->
            <div class="mb-3 form-row">
                <label for="arg_Gender" class="form-label">Gender:</label>
                <select name="arg_Gender" class="form-select" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
            </div>

            <!-- Hourly Rate -->
            <div class="mb-3 form-row">
                <label for="arg_HourlyRate" class="form-label">Hourly Rate: ie (1-100)</label>
                <input type="text" name="arg_HourlyRate" class="form-control" required>
            </div>

            <!-- Job Involvement -->
            <div class="mb-3 form-row">
                <label for="arg_JobInvolvement" class="form-label">Job Involvement: ie (1-5)</label>
                <input type="text" name="arg_JobInvolvement" class="form-control" required>
            </div>

            <!-- Job Level -->
            <div class="mb-3 form-row">
                <label for="arg_JobLevel" class="form-label">Job Level: ie (1-5)</label>
                <input type="text" name="arg_JobLevel" class="form-control" required>
            </div>

            <!-- Job Role -->
            <div class="mb-3 form-row">
                <label for="arg_JobRole" class="form-label">Employee's Job Role:</label>
                <select name="arg_JobRole" class="form-select" required>
                    <option value="Sales Executive">Sales Executive</option>
                    <option value="Laboratory Technician">Laboratory Technician</option>
                    <option value="Research Scientist">Research Scientist</option>
                    <option value="Sales Representative">Sales Representative</option>
                    <option value="Manufacturing Director">Manufacturing Director</option>
                    <option value="Healthcare Representative">Healthcare Representative</option>
                    <option value="Manager">Manager</option>
                    <option value="Human Resources">Human Resources</option>
                </select>
            </div>

            <!-- Job Satisfaction -->
            <div class="mb-3 form-row">
                <label for="arg_JobSatisfaction" class="form-label">Job Satisfaction: ie (1-5)</label>
                <input type="text" name="arg_JobSatisfaction" class="form-control" required>
            </div>
            </div>

            <div class="col-md-3 row">
            <!-- Marital Status -->
            <div class="mb-3 form-row">
                <label for="arg_MaritalStatus" class="form-label">Employee's Marital Status:</label>
                <select name="arg_MaritalStatus" class="form-select" required>
                    <option value="Single">Single</option>
                    <option value="Married">Married</option>
                    <option value="Divorced">Divorced</option>
                </select>
            </div>

            <!-- Monthly Income -->
            <div class="mb-3 form-row">
                <label for="arg_MonthlyIncome" class="form-label">Monthly Income:ie (1- ~)</label>
                <input type="text" name="arg_MonthlyIncome" class="form-control" required>
            </div>

            <!-- Monthly Rate -->
            <div class="mb-3 form-row">
                <label for="arg_MonthlyRate" class="form-label">Monthly Rate: ie (1-~)</label>
                <input type="text" name="arg_MonthlyRate" class="form-control" required>
            </div>

            <!-- Num Companies Worked -->
            <div class="mb-3 form-row">
                <label for="arg_NumCompaniesWorked" class="form-label">Number Companies Worked: ie (1-20)</label>
                <input type="text" name="arg_NumCompaniesWorked" class="form-control" required>
            </div>

            <!-- OverTime -->
            <div class="mb-3 form-row">
                <label for="arg_OverTime" class="form-label">Does the employee work overtime?</label>
                <select name="arg_OverTime" class="form-select" required>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select>
            </div>

            <!-- Percent Salary Hike -->
            <div class="mb-3 form-row">
                <label for="arg_PercentSalaryHike" class="form-label">Percent Salary Hike: ie (1-100)</label>
                <input type="text" name="arg_PercentSalaryHike" class="form-control" required>
            </div>

            <!-- Performance Rating -->
            <div class="mb-3 form-row">
                <label for="arg_PerformanceRating" class="form-label">Performance Rating: ie (1-5)</label>
                <input type="text" name="arg_PerformanceRating" class="form-control" required>
            </div>
            </div>
            <div class="col-md-3 row">
            <!-- Relationship Satisfaction -->
            <div class="mb-3 form-row">
                <label for="arg_RelationshipSatisfaction" class="form-label">Relationship Satisfaction: ie (1-5)</label>
                <input type="text" name="arg_RelationshipSatisfaction" class="form-control" required>
            </div>

            <!-- Stock Option Level -->
            <div class="mb-3 form-row">
                <label for="arg_StockOptionLevel" class="form-label">Stock Option Level: ie (1-5)</label>
                <input type="text" name="arg_StockOptionLevel" class="form-control" required>
            </div>

            <!-- Total Working Years -->
            <div class="mb-3 form-row">
                <label for="arg_TotalWorkingYears" class="form-label">Total Working Years: ie (1-70)</label>
                <input type="text" name="arg_TotalWorkingYears" class="form-control" required>
            </div>

            <!-- Training Times Last Year -->
            <div class="mb-3 form-row">
                <label for="arg_TrainingTimesLastYear" class="form-label">Training Times Last Year: ie (1-7)</label>
                <input type="text" name="arg_TrainingTimesLastYear" class="form-control" required>
            </div>

            <!-- Work Life Balance -->
            <div class="mb-3 form-row">
                <label for="arg_WorkLifeBalance" class="form-label">Work Life Balance: ie (1-5)</label>
                <input type="text" name="arg_WorkLifeBalance" class="form-control" required>
            </div>

            <!-- Years At Company -->
            <div class="mb-3 form-row">
                <label for="arg_YearsAtCompany" class="form-label">Years At Company: ie (1-70)</label>
                <input type="text" name="arg_YearsAtCompany" class="form-control" required>
            </div>

            <!-- Years In Current Role -->
            <div class="mb-3 form-row">
                <label for="arg_YearsInCurrentRole" class="form-label">Years In Current Role: ie (1-70)</label>
                <input type="text" name="arg_YearsInCurrentRole" class="form-control" required>
            </div>
            </div>
            <!-- Years Since Last Promotion -->
            <div class="mb-3 form-row">
                <label for="arg_YearsSinceLastPromotion" class="form-label">Years Since Last Promotion: ie (1-15)</label>
                <input type="text" name="arg_YearsSinceLastPromotion" class="form-control" required>
            </div>

            <!-- Years With Curr Manager -->
            <div class="mb-3 form-row">
                <label for="arg_YearsWithCurrManager" class="form-label">Years With Curr Manager: ie (1-30)</label>
                <input type="text" name="arg_YearsWithCurrManager" class="form-control" required>
            </div>

            <!-- Submit Button -->
            <div class="col-md-10 row">
                <input type="submit" value="Submit" class="btn btn-primary btn-block">
            </div>
        </form>

        <?php
        // Display the predicted Attrition
        if (!empty($predictedType)) {
            echo '<h2>' ,"The Predicted Attrition:" ."<br>" . $predictedType . '</h2>';
        }
        ?>
        <div class="col-md-16 row" style="background-color: white;">    
        <!-- <div class="col-md-6 my-1">
             <div class="card">
                <div class="card-body text-center">
                    <strong>
                        Age vs Attrition Scatter Plot<br>
                        <u>Relationship between Age and Attrition</u><br>
                    </strong>
                </div>
                <div class="card-body">
                    <canvas id="attritionPieChart"></canvas>
                 </div>
                 </div>   
            </div> -->
    <div class="col-md-6 my-1">
        <div class="card">
            <div class="card-body text-center">
                <strong>
                Your Level Of Attrition vs all Employees<br>
                <ul> pie chart</ul> <br>
                </strong>
            </div>
            <div class="card-body">
                <canvas id="attritionPieChart"></canvas>
            </div>
        </div>
    </div>
    <div class="col-md-6 my-1">
        <div class="card">
            <div class="card-body text-center">
                <strong>
                Your Performance Rating vs all employees<br>
                <ul> Radar chart</ul> 
                </strong>
            </div>
            <div class="card-body">
                <canvas id="performanceRadarChart"></canvas>
            </div>
        </div>
    </div>

    <div class="col-md-6 my-1">
        <div class="card">
            <div class="card-body text-center">
                <strong>
                Your Age Group Distribution<br>
                <ul> bar chart</ul> <br>
                </strong>
            </div>
            <div class="card-body">
                <canvas id="ageBarChart"></canvas>
            </div>
        </div>
    </div>
    <div class="col-md-6 my-1">
        <div class="card">
            <div class="card-body text-center">
                <strong>
                Your Job Role Distribution<br>
                <ul> Treemap</ul> 
                </strong>
            </div>
            <div class="card-body">
                <div id="jobRoleTreemap"></div>
            </div>
        </div>
    </div>
    
    <div class="col-md-6 my-1">
        <div class="card">
            <div class="card-body text-center">
                <strong>
                Your Distance from Home Distribution<br>
                <ul> scatter plot</ul> 
                </strong>
            </div>
            <div class="card-body">
                <canvas id="distanceScatterPlot"></canvas>
            </div>
        </div>
    </div>
    
    <div class="col-md-6 my-1">
        <div class="card">
            <div class="card-body text-center">
                <strong>
                Your percentage Salary Hike vs Rates<br>
                <ul> line chart</ul> 
                </strong>
            </div>
            <div class="card-body">
                <canvas id="salaryComparisonChart"></canvas>
            </div>
        </div>
    </div>
    </div>
    </div>
    

    <!-- # ****************************************************attritionieChart******************************************************************************************** -->

    <script>
       // Check if $predictedType is set before using it
if (isset($predictedType)) {
    // Process the response to get predicted values
    $predictedAttrition = htmlspecialchars($predictedType);
} else {
    // Handle the case where $predictedType is not set
    $predictedAttrition = "Yes"; // Provide a default value or handle the situation appropriately
}


        // Extract the binary classification (Yes or No)
        var attritionValue = predictedAttrition.toLowerCase().includes('Yes') ? 'Yes' : 'No';

        // Generate a pie chart
        var ctx = document.getElementById('attritionieChart').getContext('2d');
        var attritionPieChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['No ', 'Yes'],
                datasets: [{
                    data: [
                        (attritionValue === 'No') ? 100 : 0, // Assuming 'No' is 100%
                        (attritionValue === 'Yes') ? 100 : 0, // Assuming 'Yes' is 100%
                    ],
                    backgroundColor: ['#36A2EB', '#FF6384'],
                    hoverBackgroundColor: ['#36A2EB', '#FF6384'],
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    position: 'bottom',
                },
            }
        });
    </script>

<?php
// Function to fetch data from the database
function fetchDataFromDatabase()
{
    // Establish a database connection (replace with your database credentials)
    $mysqli = new mysqli("localhost", "root", "", "employee_attrition");

    // Check connection
    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }

    // Prepare the SQL statement
    $stmt = $mysqli->prepare("SELECT PredictedAttrition FROM employee_customerfacing_data");

    // Execute the statement
    $stmt->execute();

    // Bind the result variables
    $stmt->bind_result($predictedAttrition);

    // Fetch the data into an array
    $data = array();
    while ($stmt->fetch()) {
        $data[] = $predictedAttrition;
    }

    // Close the statement and connection
    $stmt->close();
    $mysqli->close();

    return $data;
}

// Fetch data from the database
$databaseValues = fetchDataFromDatabase();

// Check if $predictedType is set before using it
if (isset($predictedType)) {
    // Process the response to get predicted values
    $predictedAttrition = htmlspecialchars($predictedType);
} else {
    // Handle the case where $predictedType is not set
    $predictedAttrition = "Yes"; // Provide a default value or handle the situation appropriately
}


// Extract the binary classification (Yes or No)
$attritionValue = strtolower($predictedAttrition) === 'the predicted attrition is: yes<br>' ? 'Yes' : 'No';

// Generate data for Chart.js
$chartData = array_count_values(array_merge([$attritionValue], $databaseValues));
?>


<script>
    // Process the fetched data
    var chartData = <?php echo json_encode($chartData); ?>;

    // Extract data for the pie chart
    var yesValue = chartData['Yes'] || 0;
    var noValue = chartData['No'] || 0;

    // Generate a pie chart
    var ctx = document.getElementById('attritionPieChart').getContext('2d');
    var attritionPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['Yes', 'No'],
            datasets: [{
                data: [yesValue, noValue],
                backgroundColor: ['#36A2EB', '#FF6384'],
                borderColor: '#ffffff', // Border color for each slice
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            legend: {
                position: 'bottom', // Adjust the legend position as needed
            },
            tooltips: {
                callbacks: {
                    label: function (tooltipItem, data) {
                        var label = data.labels[tooltipItem.index];
                        var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
                        return label + ': ' + value;
                    }
                }
            }
        }
    });
</script>

<!-- # **********************************************************************AgeDistribution()************************************************************************** -->

<?php
// Function to fetch data from the database
function fetchDataFromData()
{
    // Establish a database connection (replace with your database credentials)
    $mysqli = new mysqli("localhost", "root", "", "employee_attrition");

    // Check connection
    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }

    // Prepare the SQL statement
    $stmt = $mysqli->prepare("CALL GetAgeDistribution()");

    // Execute the statement
    $stmt->execute();

    // Bind the result variables
    $stmt->bind_result($ageGroup, $count);

    // Fetch the data into arrays
    $ageGroups = [];
    $ageCounts = [];
    while ($stmt->fetch()) {
        $ageGroups[] = $ageGroup;
        $ageCounts[] = $count;
    }

    // Close the statement and connection
    $stmt->close();
    $mysqli->close();

    return [
        'ageGroups' => $ageGroups,
        'ageCounts' => $ageCounts,
    ];
}

// Fetch data from the database
$ageData = fetchDataFromData();

// Generate data for Chart.js
$chartData = [
    'labels' => $ageData['ageGroups'],
    'data' => $ageData['ageCounts'],
];
?>

<script>
    // Process the fetched data
    var chartData = <?php echo json_encode($chartData); ?>;

    // Generate a bar chart
    var ctx = document.getElementById('ageBarChart').getContext('2d');
    var ageBarChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: chartData.labels,
            datasets: [{
                label: 'Number of Employees',
                data: chartData.data,
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Number of Employees'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Age Groups'
                    }
                }
            },
            plugins: {
                legend: {
                    display: false,
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return 'Number of Employees: ' + context.parsed.y;
                        }
                    }
                }
            }
        }
    });
</script>

<!-- # *******************************************************PerformanceRating***************************************************************************************** -->

<?php
// Function to fetch data from the database
function fetchDataFrombase()
{
    // Establish a database connection (replace with your database credentials)
    $mysqli = new mysqli("localhost", "root", "", "employee_attrition");

    // Check connection
    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }

    // Prepare the SQL statement
    $stmt = $mysqli->prepare("SELECT PerformanceRating, COUNT(*) AS Count FROM employee_customerfacing_data GROUP BY PerformanceRating");

    // Execute the statement
    $stmt->execute();

    // Bind the result variables
    $stmt->bind_result($performanceRating, $count);

    // Fetch the data into arrays
    $performanceRatings = [];
    $counts = [];
    while ($stmt->fetch()) {
        $performanceRatings[] = $performanceRating;
        $counts[] = $count;
    }

    // Close the statement and connection
    $stmt->close();
    $mysqli->close();

    return [
        'performanceRatings' => $performanceRatings,
        'counts' => $counts,
    ];
}

// Fetch data from the database
$performanceData = fetchDataFrombase();

// Generate data for Chart.js
$chartData = [
    'labels' => $performanceData['performanceRatings'],
    'data' => $performanceData['counts'],
];
?>

<script>
    // Process the fetched data
    var chartData = <?php echo json_encode($chartData); ?>;

    // Generate a radar chart
    var ctx = document.getElementById('performanceRadarChart').getContext('2d');
    var performanceRadarChart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: chartData.labels,
            datasets: [{
                label: 'Performance Rating Distribution',
                data: chartData.data,
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 2
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                r: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Count'
                    }
                }
            }
        }
    });
</script>

<!-- # *****************************************Distance From Home******************************************************************************************************* -->

<?php
// Function to fetch data from the database
function fetchData()
{
    // Establish a database connection (replace with your database credentials)
    $mysqli = new mysqli("localhost", "root", "", "employee_attrition");

    // Check connection
    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }

    // Prepare the SQL statement
    $stmt = $mysqli->prepare("SELECT DistanceFromHome, EnvironmentSatisfaction FROM employee_customerfacing_data");

    // Execute the statement
    $stmt->execute();

    // Bind the result variables
    $stmt->bind_result($distanceFromHome, $environmentSatisfaction);

    // Fetch the data into arrays
    $distances = [];
    $environmentSatisfactions = [];
    while ($stmt->fetch()) {
        $distances[] = $distanceFromHome;
        $environmentSatisfactions[] = $environmentSatisfaction;
    }

    // Close the statement and connection
    $stmt->close();
    $mysqli->close();

    return [
        'distances' => $distances,
        'environmentSatisfactions' => $environmentSatisfactions,
    ];
}

// Fetch data from the database
$scatterData = fetchData();

// Generate data for Chart.js
$chartData = [
    'labels' => 'Distance From Home',
    'data' => array_map(function ($distance, $environmentSatisfaction) {
        return ['x' => $distance, 'y' => $environmentSatisfaction];
    }, $scatterData['distances'], $scatterData['environmentSatisfactions']),
];
?>

<script>
    // Process the fetched data
    var chartData = <?php echo json_encode($chartData); ?>;

    // Generate a scatter plot
    var ctx = document.getElementById('distanceScatterPlot').getContext('2d');
    var distanceScatterPlot = new Chart(ctx, {
        type: 'scatter',
        data: {
            datasets: [{
                label: 'Distance From Home vs. Environment Satisfaction',
                data: chartData.data,
                backgroundColor: 'rgba(75, 192, 192, 0.5)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    type: 'linear',
                    position: 'bottom',
                    title: {
                        display: true,
                        text: 'Distance From Home'
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: 'Environment Satisfaction'
                    }
                }
            },
            plugins: {
                legend: {
                    display: true,
                    position: 'bottom',
                },
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            var label = context.dataset.label || '';
                            if (label) {
                                label += ': ';
                            }
                            label += '(' + context.parsed.x + ', ' + context.parsed.y + ')';
                            return label;
                        }
                    }
                }
            }
        }
    });
</script>

<!-- # *****************************************Job Role Treemap******************************************************************************************************* -->


<?php
// Function to fetch data from the database
function fetchDataJob()
{
    // Establish a database connection (replace with your database credentials)
    $mysqli = new mysqli("localhost", "root", "", "employee_attrition");

    // Check connection
    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }

    // Prepare the SQL statement
    $stmt = $mysqli->prepare("SELECT JobRole, COUNT(*) AS Count FROM employee_customerfacing_data GROUP BY JobRole");

    // Execute the statement
    $stmt->execute();

    // Bind the result variables
    $stmt->bind_result($jobRole, $count);

    // Fetch the data into an array
    $data = [];
    while ($stmt->fetch()) {
        $data[] = ['name' => $jobRole, 'value' => $count];
    }

    // Close the statement and connection
    $stmt->close();
    $mysqli->close();

    return $data;
}

// Fetch data from the database
$jobRoleData = fetchDataJob();
?>
<script>
    // Fetch data
    var jobRoleData = <?php echo json_encode(['name' => 'root', 'children' => $jobRoleData]); ?>;

    // Create a treemap
    var width = 400;
    var height = 300;

    // Define a color scale
    var color = d3.scaleOrdinal(d3.schemeCategory10);

    var treemap = d3.treemap()
        .size([width, height])
        .padding(1);

    var root = d3.hierarchy(jobRoleData)
        .sum(function (d) { return d.value; })
        .sort(function (a, b) { return b.value - a.value; });

    treemap(root);

    // Append the treemap to the specified div
    var svg = d3.select("#jobRoleTreemap")
        .append("svg")
        .attr("width", width)
        .attr("height", height);

    svg.selectAll("rect")
        .data(root.leaves())
        .enter().append("rect")
        .attr("x", function (d) { return d.x0; })
        .attr("y", function (d) { return d.y0; })
        .attr("width", function (d) { return d.x1 - d.x0; })
        .attr("height", function (d) { return d.y1 - d.y0; })
        .style("fill", function (d) { return color(d.data.name); })  // Use color scale
        .append("title")
        .text(function (d) { return d.data.name + ": " + d.value; });
</script>

<!-- # ************************************************************************************************************************************************ -->

<?php
// Fetch data from the database (replace this with your actual data retrieval logic)
function fetchSalaryComparisonData()
{
    // Your database connection and query logic here
    // Sample data for illustration purposes
    $data = [
        ['Days' => 1, 'PercentSalaryHike' => 8, 'DailyRateDifference' => 20, 'HourlyRateDifference' => 10, 'MonthlyRateDifference' => 50],
        ['Days' => 2, 'PercentSalaryHike' => 6, 'DailyRateDifference' => 15, 'HourlyRateDifference' => 5, 'MonthlyRateDifference' => 30],
        ['Days' => 3, 'PercentSalaryHike' => 5, 'DailyRateDifference' => 18, 'HourlyRateDifference' => 8, 'MonthlyRateDifference' => 40],
        ['Days' => 4, 'PercentSalaryHike' => 7, 'DailyRateDifference' => 22, 'HourlyRateDifference' => 12, 'MonthlyRateDifference' => 55],
        ['Days' => 5, 'PercentSalaryHike' => 9, 'DailyRateDifference' => 25, 'HourlyRateDifference' => 15, 'MonthlyRateDifference' => 60],
        ['Days' => 6, 'PercentSalaryHike' => 8, 'DailyRateDifference' => 20, 'HourlyRateDifference' => 10, 'MonthlyRateDifference' => 50],
        ['Days' => 7, 'PercentSalaryHike' => 6, 'DailyRateDifference' => 15, 'HourlyRateDifference' => 5, 'MonthlyRateDifference' => 30],
        ['Days' => 8, 'PercentSalaryHike' => 5, 'DailyRateDifference' => 18, 'HourlyRateDifference' => 8, 'MonthlyRateDifference' => 40],
        ['Days' => 9, 'PercentSalaryHike' => 7, 'DailyRateDifference' => 22, 'HourlyRateDifference' => 12, 'MonthlyRateDifference' => 55],
        ['Days' => 10, 'PercentSalaryHike' => 9, 'DailyRateDifference' => 25, 'HourlyRateDifference' => 15, 'MonthlyRateDifference' => 60],
        ['Days' => 11, 'PercentSalaryHike' => 8, 'DailyRateDifference' => 20, 'HourlyRateDifference' => 10, 'MonthlyRateDifference' => 50],
        ['Days' => 12, 'PercentSalaryHike' => 6, 'DailyRateDifference' => 15, 'HourlyRateDifference' => 5, 'MonthlyRateDifference' => 30],
        ['Days' => 13, 'PercentSalaryHike' => 5, 'DailyRateDifference' => 18, 'HourlyRateDifference' => 8, 'MonthlyRateDifference' => 40],
        ['Days' => 14, 'PercentSalaryHike' => 7, 'DailyRateDifference' => 22, 'HourlyRateDifference' => 12, 'MonthlyRateDifference' => 55],
        ['Days' => 15, 'PercentSalaryHike' => 9, 'DailyRateDifference' => 25, 'HourlyRateDifference' => 15, 'MonthlyRateDifference' => 60],
        
    ];

    return $data;
}

// Fetch salary comparison data
$salaryComparisonData = fetchSalaryComparisonData();
?>

<!-- Include Chart.js from CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    // Extract data for the line chart
    var days = <?php echo json_encode(array_column($salaryComparisonData, 'Days')); ?>;
    var percentSalaryHike = <?php echo json_encode(array_column($salaryComparisonData, 'PercentSalaryHike')); ?>;
    var dailyRateDifference = <?php echo json_encode(array_column($salaryComparisonData, 'DailyRateDifference')); ?>;
    var hourlyRateDifference = <?php echo json_encode(array_column($salaryComparisonData, 'HourlyRateDifference')); ?>;
    var monthlyRateDifference = <?php echo json_encode(array_column($salaryComparisonData, 'MonthlyRateDifference')); ?>;

    // Create a line chart
    var ctx = document.getElementById('salaryComparisonChart').getContext('2d');
    var salaryComparisonChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: days,
            datasets: [
                {
                    label: 'Percent Salary Hike',
                    borderColor: '#FF6384',
                    data: percentSalaryHike,
                    fill: false
                },
                {
                    label: 'Daily Rate Difference',
                    borderColor: '#36A2EB',
                    data: dailyRateDifference,
                    fill: false
                },
                {
                    label: 'Hourly Rate Difference',
                    borderColor: '#FFCE56',
                    data: hourlyRateDifference,
                    fill: false
                },
                {
                    label: 'Monthly Rate Difference',
                    borderColor: '#4CAF50',
                    data: monthlyRateDifference,
                    fill: false
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    type: 'linear',
                    position: 'bottom'
                },
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: true,
                    position: 'bottom'
                }
            }
        }
    });
</script>

<?php
// Function to fetch Monthly Income data from the database
function fetchMonthlyIncomeData()
{
    // Replace these with your actual database credentials
    $host = 'localhost';
    $username = 'root';
    $password = '';
    $database = 'employee_attrition';

    // Establish a database connection
    $mysqli = new mysqli($host, $username, $password, $database);

    // Check connection
    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }

    // Prepare the SQL statement
    $stmt = $mysqli->prepare("SELECT MonthlyIncome FROM employee_customerfacing_data");

    // Execute the statement
    $stmt->execute();

    // Bind the result variables
    $stmt->bind_result($monthlyIncome);

    // Fetch the data into an array
    $monthlyIncomeData = [];
    while ($stmt->fetch()) {
        $monthlyIncomeData[] = $monthlyIncome;
    }

    // Close the statement and connection
    $stmt->close();
    $mysqli->close();

    return $monthlyIncomeData;
}

// Fetch Monthly Income data from the database
$monthlyIncomeData = fetchMonthlyIncomeData();
?>

<!-- Include Chart.js from CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    // Extract data for the box plot
    var monthlyIncome = <?php echo json_encode($monthlyIncomeData); ?>;

    // Create a box plot
    var ctx = document.getElementById('monthlyIncomeBoxPlot').getContext('2d');
    var monthlyIncomeBoxPlot = new Chart(ctx, {
        type: 'boxplot',
        data: {
            labels: ['Monthly Income'],
            datasets: [{
                data: monthlyIncome,
                backgroundColor: 'rgba(255, 99, 132, 0.5)', // Adjust color as needed
                borderColor: 'rgba(255, 99, 132, 1)', // Adjust color as needed
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    title: {
                        display: true,
                        text: 'Monthly Income'
                    }
                }
            }
        }
    });
</script>


</body>
</html>




