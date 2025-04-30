<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style>
  header.admin-header {
    background-color: #111c55;
  }

  .admin-header .nav-link {
    color: #ffffff;
    transition: 0.3s ease;
    position: relative;
  }

  .admin-header .nav-link:hover,
  .admin-header .nav-link.active {
    color: #ffc107; /* Yellow color on hover */
  }

  /* Fancy underline on hover */
  .admin-header .nav-link::after {
    content: "";
    position: absolute;
    width: 0;
    height: 2px;
    left: 50%;
    bottom: 0;
    background-color: #ffc107;
    transition: all 0.3s ease-in-out;
  }

  .admin-header .nav-link:hover::after {
    width: 100%;
    left: 0;
  }

  .admin-header .logo-text {
    font-size: 1.5rem;
    font-weight: 500;
    color: #ffffff;
  }

  .admin-header .btn-logout {
    border-color: #ffc107;
    color: #ffc107;
  }

  .admin-header .btn-logout:hover {
    background-color: #ffc107;
    color: #000;
  }

  @media (max-width: 991.98px) {
    .admin-header ul.nav {
      flex-wrap: wrap;
      justify-content: center;
    }
  }
</style>

<header class="admin-header py-3 mb-4 border-bottom">
  <div class="container d-flex flex-wrap align-items-center justify-content-between">
    <!-- Logo and Title -->
    <a href="/admindashboard" class="d-flex align-items-center mb-2 mb-lg-0 text-decoration-none">
      <!-- Replace with your custom logo or icon here -->
      <span class="logo-text">Admin Dashboard</span>
    </a>

    <!-- Navigation Menu -->
    <ul class="nav col-12 col-lg-auto mb-2 justify-content-center mb-md-0">
      <li class="nav-item"><a href="/admindashboard" class="nav-link px-3 active" aria-current="page">Home</a></li>
      <li class="nav-item"><a href="/users" class="nav-link px-3">View Users</a></li>
      <li class="nav-item"><a href="/viewcontact" class="nav-link px-3">View Contacts</a></li>
      <li class="nav-item"><a href="/viewfaqs" class="nav-link px-3">View Faqs</a></li>
      <li class="nav-item"><a href="/viewgallery" class="nav-link px-3">View Gallery</a></li>
      <li class="nav-item"><a href="/aprofile" class="nav-link px-3">Profile</a></li>
      <li class="nav-item"><a href="/addleave" class="nav-link px-3">Add Leave</a></li>
      <li class="nav-item"><a href="/assignleave" class="nav-link px-3">Assign Leave</a></li>
      <li class="nav-item"><a href="/viewapplyleave" class="nav-link px-3">Applied Leave</a></li>
    </ul>

    <!-- Logout Button -->
    <div class="text-end">
      <a href="/logout" class="btn btn-outline-warning btn-logout">Logout</a>
    </div>
  </div>
</header>
