<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style>
  header.custom-header {
    background-color: rgba(17, 28, 85, 0.9);
    position: fixed; top: 0; width: 100%; z-index: 1000;
  }

  .custom-header .nav-link {
    color: #fff;
    transition: 0.3s ease;
    position: relative;
  }

  .custom-header .nav-link:hover,
  .custom-header .nav-link.active {
    color: #ffc107;
  }

  /* Fancy underline on hover */
  .custom-header .nav-link::after {
    content: "";
    position: absolute;
    width: 0;
    height: 2px;
    left: 50%;
    bottom: 0;
    background-color: #ffc107;
    transition: all 0.3s ease-in-out;
  }

  .custom-header .nav-link:hover::after {
    width: 100%;
    left: 0;
  }

  .custom-header .btn-outline-light:hover {
    background-color: #ffc107;
    color: #000;
    border-color: #ffc107;
  }

  .custom-header .btn-warning:hover {
    background-color: #e0a800;
    border-color: #e0a800;
  }

  .logo-text {
    font-size: 1.5rem;
    font-weight: 600;
    color: #ffffff;
  }
  .navbar-brand {
    font-weight: 700;
    font-size: 1.5rem;
    color: #ffc107; /* or use your custom --primary-color if defined */
    transition: color 0.3s ease;
  }

  .navbar-brand:hover {
    color: #fff; /* Matches the hover color from nav links */
  }
</style>

<header class="p-3 custom-header">
  <div class="container">
    <div class="row align-items-center">
      <!-- Logo -->
      <div class="col-md-3 text-center text-md-start mb-3 mb-md-0">
        <a href="index.jsp" class="navbar-brand d-inline-flex align-items-center text-decoration-none">Seeree</a>
      </div>

      <!-- Nav Menu -->
      <div class="col-md-6">
        <ul class="nav justify-content-center">
          <li class="nav-item"><a href="/index" class="nav-link px-3">Home</a></li>
          <li class="nav-item"><a href="/contact" class="nav-link px-3">Contact Us</a></li>
          <li class="nav-item"><a href="/services" class="nav-link px-3">Our Services</a></li>
          <li class="nav-item"><a href="/faq" class="nav-link px-3">FAQs</a></li>
          <li class="nav-item"><a href="/about" class="nav-link px-3">About</a></li>
        </ul>
      </div>

      <!-- Auth Buttons -->
      <div class="col-md-3 text-center text-md-end mt-3 mt-md-0">
        <a href="/login" class="btn btn-outline-light me-2">Login</a>
        <a href="/register" class="btn btn-warning">Sign-up</a>
      </div>
    </div>
  </div>
</header>
