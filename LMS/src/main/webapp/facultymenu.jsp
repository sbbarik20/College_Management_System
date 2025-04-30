<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style>
  header {
    background-color: #111c55;
  }

  .nav-link {
    color: #ffffff;
    transition: 0.3s ease;
    position: relative;
  }

  .nav-link:hover,
  .nav-link.active {
    color: #ffc107; /* Yellow color on hover */
  }

  /* Fancy underline on hover */
  .nav-link::after {
    content: "";
    position: absolute;
    width: 0;
    height: 2px;
    left: 50%;
    bottom: 0;
    background-color: #ffc107;
    transition: all 0.3s ease-in-out;
  }

  .nav-link:hover::after {
    width: 100%;
    left: 0;
  }

  .btn-logout {
    border-color: #ffc107;
    color: #ffc107;
  }

  .btn-logout:hover {
    background-color: #ffc107;
    color: #000;
  }

  .logo-text {
    font-size: 1.5rem;
    font-weight: 500;
    color: #ffffff;
  }
</style>

<header class="py-3 mb-4 border-bottom">
  <div class="container d-flex flex-wrap align-items-center justify-content-between">
    <!-- Logo and Title -->
    <a href="/facultydashboard" class="d-flex align-items-center mb-2 mb-lg-0 text-decoration-none">
      <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
      <span class="logo-text">Faculty Dashboard</span>
    </a>

    <!-- Navigation Links -->
    <ul class="nav col-12 col-lg-auto mb-2 justify-content-center mb-md-0">
      <li><a href="/facultydashboard" class="nav-link px-3 active">Home</a></li>
      <li><a href="/addVideo" class="nav-link px-3">Add Video</a></li>
      <li><a href="/addquestions" class="nav-link px-3">Add Questions</a></li>
      <li><a href="/viewresult" class="nav-link px-3">View Result</a></li>
      <li><a href="/fprofile" class="nav-link px-3">Profile</a></li>
      <li><a href="/applyleave" class="nav-link px-3">Apply Leave</a></li>
    </ul>

    <!-- Logout Button -->
    <div class="text-end">
      <a href="/logout" class="btn btn-outline-warning btn-logout">Logout</a>
    </div>
  </div>
</header>
