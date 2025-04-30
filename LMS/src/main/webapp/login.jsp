<jsp:include page="menu.jsp" />




<section class="bg-light py-3 py-md-5 py-xl-8">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4">
          <div class="mb-5">
            <h4 class="text-center mb-4">Welcome !</h4>
          </div>
          <div class="card border border-light-subtle rounded-4">
            <div class="card-body p-3 p-md-4 p-xl-5">
              <form action="/login" method="post">
                <div class="row gy-3 overflow-hidden">
                  <div class="col-12">
                    <div class="form-floating mb-3">
                      <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required>
                      <label for="email" class="form-label">Email</label>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="form-floating mb-3">
                      <input type="password" class="form-control" name="password" id="password" value="" placeholder="Password" required>
                      <label for="password" class="form-label">Password</label>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" name="remember_me" id="remember_me">
                      <label class="form-check-label text-secondary" for="remember_me">
                        Keep me logged in
                      </label>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="d-grid">
                      <button class="btn btn-primary btn-lg" type="submit">Log in</button>
                      <div class="col-12">
                        <p class="m-0 text-secondary text-center">Already have an account? <a href="/register" class="link-primary text-decoration-none">Sign up</a></p>
                      </div>    
                    </div>
                  </div>
                </div>
              </form>
              ${msg}
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


























  

<!-- <center>
  <form action="/login" method="post">

     
      Email: <input type="text" name="email" />     <br>
     
      <br />
      Password: <input type="text" name="password" />     <br>  
      <br />
     
      <input type="Submit" value="Register" />
    
  </form>    
 
</center>  
${msg} -->
























