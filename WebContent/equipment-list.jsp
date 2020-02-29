<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ie.ucd.EEEN3010J.*" %>
<%@ page import="java.util.List" %>
<script>
function alertFailed(){
	alert("Please login first!");
	window.document.location.href="index.html";
}
</script>
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

  <title>Equipment List | HETS</title>

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
      <li class="nav-item">
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
      <li class="nav-item active">
        <a class="nav-link" href="equipment-list.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Find & Manage Equipment</span></a>
      </li>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBR" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Borrow / Return</span>
        </a>
        <div id="collapseBR" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <!-- <h6 class="collapse-header">Borrow From Depart.</h6> -->
            <a class="collapse-item" href="borrow-equipment.jsp">Borrow Equipments</a>
            <div class="collapse-divider"></div>
            <!-- <h6 class="collapse-header">Return To Depart.</h6> -->
            <a class="collapse-item" href="return-equipment.jsp">Return Equipments</a>
          </div>
        </div>
      </li>
      
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
                <img class="img-profile rounded-circle" src="img/logo.png">
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
          <h1 class="h3 mb-2 text-gray-800">Find & Manage Equipment</h1>
          <p class="mb-4">
            Equipment List allows staffs to check the information of each equipment, including ID, type, current location, department that equipment belongs to, etc.
            You can track the <strong>current location</strong> of each equipment in this page. You are able to access the <strong>latest location</strong> even if the tracking device run out of power.
            You are able to check the remaining battery and you will get an warning when the power is below 20%.
            Besides, you can <strong>add</strong> new equipment or <strong>delete</strong> (if you are admin) equipment in this system. 
            
            
          </p>
          <p class="mb-4">
            <strong>Please note:</strong>
            <br />
            &bull; When you need to add a new equipment, please first import the ID, type (you can find these information from the label on physical device), then check if the record is shown on the table below. If you find the record with update time '<strong>1970-01-01 08:00:00</strong>' and location '<strong>null</strong>', your equipment is added successfully. After that, you should turn on the physical device such that the time & location will be updated automatically.
          </p>
      <hr>
          <!-- Add Equipment Button -->
          <a href="#" class="btn btn-primary btn-icon-split" data-toggle="modal" data-target="#addEquipment">
            <span class="icon text-white-50">
              <i class="fas fa-arrow-right"></i>
            </span>
            <span class="text">Add New Equipment</span>
          </a>
          <div class="my-2"></div>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Hospital Equipments Information List</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Equipment ID</th>
                      <th>Equipment Type</th>
                      <th>Update Time</th>
                      <th>Location</th>
                      <th>Power Remaining</th>
                      <th>Department Owns</th>
                      <th>Operations</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Equipment ID</th>
                      <th>Equipment Type</th>
                      <th>Update Time</th>
                      <th>Location</th>
                      <th>Power Remaining</th>
                      <th>Department Owns</th>
                      <th>Operations</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <!-- FYP Java Code Begin -->
                    <%
                      List<Equipment> equipments = EquipmentDAO.getAllEquipments();
                      for (Equipment equip : equipments) {
                    %>
                    <!-- Check equipment detailed info start -->
                    <div id="<%="EquipmentInfo_"+ equip.getEquipID() %>" class="modal fade">
                      <div class="modal-dialog modal-login">
                        <div class="modal-content">
                          <div class="modal-header">      
                            <h4 class="modal-title">Equipment Information</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          </div>
                          <div class="modal-body">
                            <form method="post" action="#">
                              <div class="form-group">
                                <label>Equipent Info</label>
                                <input type="text" name="EquipInfoID" class="form-control" readonly="true" value="<%=equip.getEquipID() %>" placeholder="<%=equip.getEquipID() %>">
                              </div>
                              <div class="form-group">
                                <label>Equipment Type</label>
                                <input type="text" name="EquipInfoType" class="form-control" readonly="true" value="<%=equip.getEquipType() %>" placeholder="<%=equip.getEquipType() %>">
                              </div>
                              <div class="form-group">
                                <label>Location</label>
                                <input type="text" name="EquipInfoLocation" class="form-control" readonly="true" value="<%=equip.getLocation() %>" placeholder="<%=equip.getLocation() %>">
                              </div>
                              <div class="form-group">
                                <label>Update Time</label>
                                <input type="text" name="EquipInfoUT" class="form-control" readonly="true" value="<%=equip.getUpdateTime() %>" placeholder="<%=equip.getUpdateTime() %>">
                              </div>
                              <div class="form-group">
                                <label>Remaining Power</label>
                                <input type="text" name="EquipInfoRP" class="form-control" readonly="true" value="<%=equip.getPower() %> %" placeholder="<%=equip.getPower() %> %">
                              </div>
                              <div class="form-group">
                                <label>Power Alarm</label>
                                <input type="text" name="EquipInfoPA" class="form-control" readonly="true" value="<%=equip.isLowPow() %>" placeholder="<%=equip.isLowPow() %>">
                              </div>
                              <div class="form-group">
                                <label>Department Code (Owns)</label>
                                <input type="text" name="EquipInfoDCO" class="form-control" readonly="true" value="<%=equip.getDeptOwns() %>" placeholder="<%=equip.getDeptOwns() %>">
                              </div>
                              <div class="form-group">
                                <label>Department Code (In Use)</label>
                                <input type="text" name="EquipInfoDCIU" class="form-control" readonly="true" value="<%=equip.getDeptInUse() %>" placeholder="<%=equip.getDeptInUse() %>">
                              </div>
                              <div class="clearfix"></div>
                            </form>       
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Check equipment detailed info end -->

                    <!-- Delete equipment start (in for loop)-->
                    <div id="<%="deleteEquipment_"+ equip.getEquipID() %>" class="modal fade">
                      <div class="modal-dialog modal-login">
                        <div class="modal-content">
                          <div class="modal-header">      
                            <h4 class="modal-title">Are you absolutely sure?</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          </div>
                          <div class="modal-body">
                            <form method="post" action="delete-equipment.jsp">
                              <div class="form-group">
                                <label>Equipment ID:</label>
                                <input type="text" name="EquipID" class="form-control" readonly="true" value="<%=equip.getEquipID() %>" placeholder="<%=equip.getEquipID() %>">
                              </div>
                              <div>
                                This action <strong>cannot</strong> be undone. This will remove the record of the device <strong><%=equip.getEquipID() %></strong>
                                You may lose track of this equipment unless you import it into the system again manually.
                              </div>
                              <hr>
                              <div class="form-group"><input type="submit" value="delete this equipment from system" class="btn btn-primary btn-block btn-lg" style="background:#CD2636; color:#FFF">
                              </div>
                              <div class="clearfix"></div>
                            </form>       
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Delete equipment end (in for loop)-->

                    <tr>
                      <td><%=equip.getEquipID() %></td>
                      <td><%=equip.getEquipType() %></td>
                      <td><%=equip.getUpdateTime() %></td>
                      <td><%=equip.getLocation() %></td>
                      <td>
                        <!-- Java code start. Determine whether the equipment can be lent base on their original owner and department in use. -->
                        <%
                          if(equip.getPower() > 20) {
                        %>
                        <a href="#" class="btn btn-success btn-circle btn-sm">
                          <i class="fas fa-check"></i>
                        </a>
                        <%
                          } else {
                        %>
                        <a href="#" class="btn btn-warning btn-circle btn-sm">
                          <i class="fas fa-exclamation-triangle"></i>
                        </a>
                        <%}%>
                        <!-- Java code end here -->
                      </td>
                      <td><%=equip.getDeptOwns() %></td>
                      <td>
                        <a href="#" class="btn btn-info btn-circle btn-sm" data-toggle="modal" data-target="<%="#EquipmentInfo_"+ equip.getEquipID() %>">
                          <i class="fas fa-info-circle"></i>
                        </a>
                        <a href="#" class="btn btn-danger btn-circle btn-sm" data-toggle="modal" data-target="<%="#deleteEquipment_"+ equip.getEquipID() %>">
                          <i class="fas fa-trash"></i>
                        </a>
                      </td>

                    </tr>

                    <%
                      }
                    %>
                    <!-- FYP Java Code End -->
                  </tbody>
                </table>
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

  <!--- Adding equipment start  --->
  <div id="addEquipment" class="modal fade">
    <div class="modal-dialog modal-login">
        <div class="modal-content">
            <div class="modal-header">      
                <h4 class="modal-title">Adding New Equipment</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form method="post" action="add-equipment.jsp">
                    <div class="form-group">
                        <label>Equipent ID:</label>
                        <input type="text" name="EquipID" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Equipent Type:</label>
                        <select name="EquipType" class="form-control">
                            <!-- <option disabled="" selected=""></option> -->
                            <option value="Not Specified">  </option>
                            <option value="Gastroscope"> Gastroscope </option>
                            <option value="Colonoscope"> Colonoscope </option>
                            <option value="Patient Trolley"> Patient Trolley </option>
                            <option value="Syringe Pump"> Syringe Pump </option>
                            <option value="Defibrillator"> Defibrillator </option>
                            <option value="Microscope Binocular"> Microscope Binocular </option>
                            <option value="Coagulometer"> Coagulometer </option>
                            <option value="Centrifuge"> Centrifuge </option>
                            <option value="Refrigerator"> Refrigerator </option>
                            <option value="Autoclave"> Autoclave </option>
                            <option value="Infusion Fluid Holder"> Infusion Fluid Holder </option>
                            <option value="Surgical Light Mobile"> Surgical Light Mobile </option>
                            <option value="Stretcher"> Stretcher </option>
                            <option value="Arthroscope"> Arthroscope </option>
                            <option value="EEG"> EEG </option>
                            <option value="Portable Ultrasound Scanner"> Portable Ultrasound Scanner </option>
                            <option value="Nebulizer"> Nebulizer </option>
                            <option value="Infant warmer"> Infant warmer </option>
                        </select>
                  </div>
                    <div class="form-group">
                        <label>Department Code This Equipment Belongs To:</label>
                        <input type="text" name="DeptOwns" class="form-control" required>
                    </div>

                    <div class="form-group"><input type="submit" value="Submit" class="btn btn-primary btn-block btn-lg"></div>
                    <div class="clearfix"></div>
                </form>       
            </div>
        </div>
    </div>
</div>
<!--- Adding equipment end  --->

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/datatables-demo.js"></script>

</body>

</html>


