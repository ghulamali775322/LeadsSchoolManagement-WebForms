<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LSMS.Dashboard" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - School Management System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
    }

    /* Sidebar */
    .sidebar {
        width: 250px;
        background-color: #1e3a8a;
        color: white;
        padding: 20px;
        position: fixed; /* <-- Fix sidebar */
        height: 100vh;
        top: 0;
        left: 0;
        overflow-y: auto;
    }

    .sidebar h6 {
        font-size: 12px;
        text-transform: uppercase;
        color: #d1d5db;
        margin-top: 15px;
        font-weight: bold;
    }

    .sidebar a {
        color: white;
        text-decoration: none;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        margin: 5px 0;
        border-radius: 5px;
        font-size: 15px;
        font-weight: 500;
        cursor: pointer;
    }

    .sidebar a:hover {
        background-color: #3b82f6;
    }

    .dropdown-container {
        display: none;
        background: white;
        border-radius: 5px;
        margin-top: 5px;
        padding: 5px 0;
    }

    .dropdown-container a {
        color: black;
        font-size: 14px;
        padding: 8px 15px;
        display: block;
        border-radius: 5px;
    }

    .dropdown-container a:hover {
        background-color: #e5e7eb;
    }

    /* Header */
    .header {
        background: white;
        padding: 10px 20px;
        border-bottom: 1px solid #ddd;
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: fixed;
        top: 0;
        left: 250px; /* <-- Important: after sidebar */
        right: 0;
        height: 70px;
        z-index: 1000;
    }

    /* Content */
    .content {
        margin-left: 250px; /* <-- Important: after sidebar */
        padding: 20px;
        padding-top: 90px; /* <-- To avoid overlap with header */
    }

    /* Logout Button */
    .logout-btn {
        margin-top: 20px;
        background-color: #dc3545;
        color: white;
        padding: 10px;
        text-align: center;
        border-radius: 5px;
        cursor: pointer;
    }

    .logout-btn:hover {
        background-color: #c82333;
    }
    
    /* Content */
    .content {
        margin-left: 250px;
        padding: 20px;
        padding-top: 30px; /* Reduced to fix extra top gap */
    }

    /* Dashboard Header */
    .dashboard-header {
        text-align: center;
        margin: 0;
        padding-top: 5px; /* Slight padding */
    }

    .dashboard-header h1 {
        font-size: 36px;
        font-weight: bold;
        color: #2c3e50;
        letter-spacing: 1px;
        margin: 0;
    }

    .dashboard-header h1 span {
        display: block;
        font-size: 24px;
        font-weight: 400;
        color: #3498db;
        margin-top: 5px;
    }


    /* Cards Section (for your three boxes) */
    .dashboard-cards {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        margin-top: 20px;
    }

    .dashboard-card {
        background: white;
        border: 1px solid #ddd;
        border-radius: 10px;
        padding: 20px;
        text-align: center;
        flex: 1;
        min-width: 250px;
        box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
    }

    .dashboard-card i {
        font-size: 40px;
        margin-bottom: 10px;
    }

    .dashboard-card h5 {
        margin-bottom: 10px;
    }

    .dashboard-card p {
        color: #666;
        margin-bottom: 20px;
    }

    .dashboard-card .btn {
        width: 100%;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <!-- Sidebar -->
        <div class="sidebar">
            <h4><i class="fas fa-tachometer-alt"></i> Dashboard</h4>

            <h6 class="mt-3">Student Registration</h6>
            <asp:LinkButton ID="lnkStudent" runat="server" CssClass="dropdown-btn" OnClientClick="toggleDropdown('studentDropdown', 'dropdownIcon'); return false;">
                <span><i class="fas fa-user-graduate"></i> Student's</span>
                <i class="fas fa-chevron-down" id="dropdownIcon"></i>
            </asp:LinkButton>
            <div class="dropdown-container" id="studentDropdown">
                <h6 class="px-3 text-secondary">STUDENT REGISTRATION:</h6>
                <asp:LinkButton ID="lnkNewRegistration" runat="server" PostBackUrl="~/NewStudent.aspx"><i class="fas fa-user-plus" ></i> New Registration</asp:LinkButton>
                <asp:LinkButton ID="lnkStudentsList" runat="server" PostBackUrl="~/StudentsList.aspx"><i class="fas fa-list"></i> Students List</asp:LinkButton>

                <h6 class="px-3 text-secondary">PROMOTION:</h6>
                <asp:LinkButton ID="lnkStudentPromote" runat="server" PostBackUrl="~/StudentPromote.aspx"><i class="fas fa-arrow-up"></i> Student Promote</asp:LinkButton>
                <asp:LinkButton ID="lnkPromoteList" runat="server" PostBackUrl="~/PromoteList.aspx"><i class="fas fa-list"></i> Promote List</asp:LinkButton>

                <h6 class="px-3 text-secondary">FEE'S:</h6>
                <asp:LinkButton ID="lnkSubmitFee" runat="server" PostBackUrl="~/SubmitStudentFee.aspx"><i class="fas fa-dollar-sign"></i> Submit Student Fee</asp:LinkButton>
                <asp:LinkButton ID="lnkFeeRecord" runat="server" PostBackUrl="~/StudentFeeRecord.aspx"><i class="fas fa-file-invoice-dollar"></i> Student Fee Record</asp:LinkButton>
</div>

            <h6 class="mt-3">Staff Registration</h6>
            <asp:LinkButton ID="lnkStaff" runat="server" CssClass="dropdown-btn" OnClientClick="toggleDropdown('teacherDropdown', 'dropdownIcon1'); return false;">
                <span><i class="fas fa-users"></i> Employee's</span>
                <i class="fas fa-chevron-down" id="dropdownIcon1"></i>
            </asp:LinkButton>
            <div class="dropdown-container" id="teacherDropdown">
                <h6 class="px-3 text-secondary">STAFF REGISTRATION:</h6>
                <asp:LinkButton ID="lnkStaffRegistration" runat="server" PostBackUrl="~/NewStaff.aspx"><i class="fas fa-user-plus"></i> Staff Registration</asp:LinkButton>
                <asp:LinkButton ID="lnkAllStaffList" runat="server" PostBackUrl="~/StaffsList.aspx"><i class="fas fa-clipboard-list"></i> All Staff List</asp:LinkButton>

                <h6 class="px-3 text-secondary">ATTENDANCE:</h6>
                <asp:LinkButton ID="lnkStaffAttendance" runat="server" PostBackUrl="~/StaffAttendance.aspx"><i class="fas fa-user-plus"></i> Staff Attendance</asp:LinkButton>
                <asp:LinkButton ID="lnkStaffAttendanceRecord" runat="server" PostBackUrl="~/StaffAttendanceRecord.aspx"><i class="fas fa-list"></i> Staff Attendance Record</asp:LinkButton>

                <h6 class="px-3 text-secondary">SALARY:</h6>
                <asp:LinkButton ID="lnkEmployeeSalary" runat="server" PostBackUrl="~/StaffSalary.aspx"><i class="fas fa-user-plus"></i> Staff Salary</asp:LinkButton>
                <asp:LinkButton ID="lnkSalariesRecord" runat="server" PostBackUrl="~/SalariesRecord.aspx"><i class="fas fa-list"></i> Salaries Record</asp:LinkButton>
            </div>

            <h6 class="mt-3">Time Schedule</h6>
            <asp:LinkButton ID="lnkClass" runat="server" CssClass="dropdown-btn" OnClientClick="toggleDropdown('classDropdown', 'dropdownIcon2'); return false;">
                <span><i class="fas fa-users"></i> Timetable</span>
                <i class="fas fa-chevron-down" id="dropdownIcon2"></i>
            </asp:LinkButton>
            <div class="dropdown-container" id="classDropdown">
                <h6 class="px-3 text-secondary">MANAGE TIMETABLE:</h6>
                <asp:LinkButton ID="lnkClasstimetable" runat="server"><i class="fas fa-user-plus"></i> Class Timetable</asp:LinkButton>
                <asp:LinkButton ID="lnkTimetableslist" runat="server"><i class="fas fa-table"></i> Timetable's List</asp:LinkButton>

                </div>

            <h6 class="mt-3">Exam Schedule</h6>
            <asp:LinkButton ID="lnkExam" runat="server" CssClass="dropdown-btn" OnClientClick="toggleDropdown('examDropdown', 'dropdownIcon3'); return false;">
                <span><i class="fas fa-users"></i> Exam & Result</span>
                <i class="fas fa-chevron-down" id="dropdownIcon3"></i>
            </asp:LinkButton>
            <div class="dropdown-container" id="examDropdown">
                <h6 class="px-3 text-secondary">EXAM DATESHEET:</h6>
                <asp:LinkButton ID="lnkClasswiseDatesheet" runat="server"><i class="fas fa-clock"></i> Classwise Datesheet</asp:LinkButton>
                <asp:LinkButton ID="lnkDatesheetlist" runat="server"><i class="fas fa-clock"></i> Datesheet List</asp:LinkButton>

                <h6 class="px-3 text-secondary">RESULT:</h6>
                <asp:LinkButton ID="lnkStudentsMarks" runat="server"><i class="fas fa-user-plus"></i> Student's Marks</asp:LinkButton>
                <asp:LinkButton ID="lnkMarkslist" runat="server"><i class="fas fa-user-plus"></i> Mark's List</asp:LinkButton>
 
                </div>

            <!-- Logout Button -->
            <asp:LinkButton ID="lnkLogout" runat="server" CssClass="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</asp:LinkButton>
        </div>

        <!-- Content -->
        <!-- Content -->
<div class="content">

    <!-- Header -->
    <div class="dashboard-header">
        <h1>Leads <span>School Management System</span></h1>
    </div>

   <div class="dashboard-cards">
    <!-- First row -->
    <div class="dashboard-card">
        <i class="fas fa-user-plus text-primary"></i>
        <h5>Register New Student</h5>
        <p>Add a new student to the system.</p>
        <a href="NewStudent.aspx" class="btn btn-primary">Register Student</a>
    </div>

    <div class="dashboard-card">
        <i class="fas fa-user-tie text-success"></i>
        <h5>Register New Employee</h5>
        <p>Add a new employee to the system.</p>
        <a href="NewStaff.aspx" class="btn btn-success">Register Employee</a>
    </div>

    <div class="dashboard-card">
        <i class="fas fa-users text-info"></i>
        <h5>View All Students</h5>
        <p>See all registered students.</p>
        <a href="StudentsList.aspx" class="btn btn-info">View Students</a>
    </div>

    <!-- Second row -->
    <div class="dashboard-card">
        <i class="fas fa-arrow-up text-warning"></i>
        <h5>Promote Student</h5>
        <p>Promote a student to the next class.</p>
        <a href="StudentPromote.aspx" class="btn btn-warning text-white">Promote Student</a>
    </div>

    <div class="dashboard-card">
        <i class="fas fa-money-bill-wave text-success"></i>
        <h5>Student Fee</h5>
        <p>Manage student fees and payments.</p>
        <a href="SubmitStudentFee.aspx" class="btn btn-success">Submit Student Fees</a>
    </div>

    <div class="dashboard-card">
        <i class="fas fa-id-badge text-secondary"></i>
        <h5>View All Employees</h5>
        <p>See all registered employees.</p>
        <a href="StaffsList.aspx" class="btn btn-secondary">View Employees</a>
    </div>
</div>
    </div>

    </form>

    <script>
        function toggleDropdown(id, iconId) {
            var dropdown = document.getElementById(id);
            var icon = document.getElementById(iconId);

            if (dropdown.style.display === "block") {
                dropdown.style.display = "none";
                icon.classList.remove("fa-chevron-up");
                icon.classList.add("fa-chevron-down");
            } else {
                dropdown.style.display = "block";
                icon.classList.remove("fa-chevron-down");
                icon.classList.add("fa-chevron-up");
            }
        }
    </script>
</body>
</html>