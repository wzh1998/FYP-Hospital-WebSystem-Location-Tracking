<%@page import="ie.ucd.EEEN3010J.EquipmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ie.ucd.EEEN3010J.User" %>
<%@ page import="ie.ucd.EEEN3010J.UserDAO" %>
<%@ page import="java.util.List" %>
<% 
if(session.getAttribute("user") == null) {
	response.sendRedirect("index.html"); 
}
%>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Overview | HETS</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="overview.jsp">
        <div class="sidebar-brand-icon">
          <img  src="img/UCDlogo.png" width="34" height="49" alt="">
        </div>       
        <div class="sidebar-brand-text mx-3">FYP-HETS <sup>BDIC</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="overview.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Overview</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Equipment
      </div>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="equipment-list.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Find & Manage Equipment</span></a>
      </li>

      <!-- Nav Item - Pages Collapse Menu -->
      <!-- <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBR" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Borrow / Return</span>
        </a>
        <div id="collapseBR" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Borrow From Depart.</h6>
            <a class="collapse-item" href="#">Borrow Equipments</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Return To Depart.</h6>
            <a class="collapse-item" href="#">Return Equipments</a>
          </div>
        </div>
      </li> -->
      
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%User u = (User) session.getAttribute("user"); %><%=u==null ? "null" : u.getUsrName() %></span>
                <img class="img-profile rounded-circle" src="img/users/<%=u==null ? "logo" : u.getUsrName() %>.png">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <!-- <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div> -->
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
          </div>
          
          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            <div class="col-lg-6 mb-4">

              <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Equipment Number Hold By Each Department</h6>
                </div>
                <div class="card-body">
                  <%int[] equipNum = new int[10]; equipNum = EquipmentDAO.getEquipNum(); %>
                  <h4 class="small font-weight-bold">Depart. of Emergency <span class="float-right"><%=equipNum[1] %></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: <%=equipNum[1] %>%" aria-valuenow="<%=equipNum[1] %>" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">Depart. of Surgery <span class="float-right"><%=equipNum[2] %></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-warning" role="progressbar" style="width: <%=equipNum[2] %>%" aria-valuenow="<%=equipNum[2] %>" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">Depart. of Neurology <span class="float-right"><%=equipNum[3] %></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar" role="progressbar" style="width: <%=equipNum[3] %>%" aria-valuenow="<%=equipNum[3] %>" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">Depart. of Pediatrics <span class="float-right"><%=equipNum[4] %></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-info" role="progressbar" style="width: <%=equipNum[4] %>%" aria-valuenow="<%=equipNum[4] %>" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">Depart. of Psychiatry <span class="float-right"><%=equipNum[5] %></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-success" role="progressbar" style="width: <%=equipNum[5] %>%" aria-valuenow="<%=equipNum[5] %>" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">Depart. of Anatomical <span class="float-right"><%=equipNum[6] %></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: <%=equipNum[6] %>%" aria-valuenow="<%=equipNum[6] %>" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">Depart. of Radiology <span class="float-right"><%=equipNum[7] %></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-warning" role="progressbar" style="width: <%=equipNum[7] %>%" aria-valuenow="<%=equipNum[7] %>" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">Depart. of Chinese Medicine <span class="float-right"><%=equipNum[8] %></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-primary" role="progressbar" style="width: <%=equipNum[8] %>%" aria-valuenow="<%=equipNum[8] %>" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>

              <!-- Approach -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
                </div>
                <div class="card-body">
                  <p>This websystem is implemented using Tomcat + Mysql + JSP. //TODO: Write more about DB design (ER diagram, normalisation, etc.)</p>
                  <p><strong>Basic Goals:</strong> 
                  <br/>• Build a low energy IoT indoor location-based system for hospital equipment
                  <br/>• Develop an API to receive and store the location of each hospital device
                  <br/>• Admin interface to register and de-register hospital equipment, as well as staff, with a role-based system.
                  <br/>• Security for the IoT tracking and API
                  <br/><br/><strong>Bonus Tasks:</strong>
                  <br/>• When Hospital Equipment is not registering (example power is depleted), the system can track previous locations to allow staff to have a general area for the current location
                  <br/>• Smart alerts for low power, to perhaps avoid Bonus Task, 1.
                  <br/>• Additional security for specific high-risk equipment, for example, when a staff member searches for the device, they are issued with a code to physically unlock/undock the device and this is logged.
                  </p>
                </div>
              </div>
            </div>

            <div class="col-lg-6 mb-4">

              <!-- Illustrations -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
                </div>
                <div class="card-body">
                  <div class="text-center">
                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="img/introfig.png" alt="">
                  </div>
                  <p>Equipment in hospitals are costly and needed on a regular basis. When equipment fails or is required in another ward/section, it is often used/fixed but never returned to its original location. This issue is compounded when staff shifts end as the new cohort is unaware of the borrowed equipment on the ward/section. This becomes a significant issue when the ward/section for who the equipment was borrowed requires the equipment. This can lead to time spent looking for the equipment, a reduction in the quality of patient care or in the worst case, a negative effect on patient outcomes.</p><p>A solution to track the location of hospital equipment in 3D space in an indoor setting, using a low energy solution would allow staff to log onto a web-based system and track the location of the equipment saving time and perhaps lives. </p>
                  <p>
                  	<strong>Techniques:</strong>
                  	<br/>• IoT, RFID, Alibaba Cloud ECS Server, MySQL.
                  	<br/>• Java, JSP, Python.
                  	
                  </p>
                  <a target="_blank" rel="nofollow" href="https://github.com/wzh1998/FYP-Hospital-WebSystem-Location-Tracking">View Details on Github &rarr;</a>
                </div>
              </div>

            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; BDIC FYP-12 HETS System 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="logout.jsp">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>

</html>



    