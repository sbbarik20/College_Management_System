
<jsp:include page="menu.jsp" />



<section class="bg-light p-3 p-md-4 p-xl-5">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
          <div class="card border border-light-subtle rounded-4">
            <div class="card-body p-3 p-md-4 p-xl-5">
              <div class="row">
                <div class="col-12">
                  <div class="mb-5">
                    <h2 class="h4 text-center">Registration</h2>
                    
                  </div>
                </div>
              </div>
              <form action="/Register" method="post">
                <div class="row gy-3 overflow-hidden">
                  <div class="col-12">
                    <div class="form-floating mb-3">
                      <input type="text" class="form-control" name="name" id="name" placeholder="Name" required>
                      <label for="Name" class="form-label">Name</label>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="form-floating mb-3">
                      <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required>
                      <label for="email" class="form-label">Email</label>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="form-floating mb-3">
                      <input type="text" class="form-control" name="mobile" id="mobile" placeholder="Mobile" required>
                      <label for="mobile" class="form-label">Mobile</label>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="form-floating mb-3">
                      <input type="password" class="form-control" name="password" id="password" value="" placeholder="Password" required>
                      <label for="password" class="form-label">Password</label>
                    </div>
                  </div>
                  <div class="col-12 d-flex align-items-center gap-3">
                    <label class="fw-bold">Role:</label>
                    
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="role" id="student" value="student" required>
                      <label class="form-check-label" for="student">Student</label>
                    </div>
                    
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="role" id="faculty" value="faculty" required>
                      <label class="form-check-label" for="faculty">Faculty</label>
                    </div>
                  </div>
                  

                  <div class="col-12">
                    <div class="d-grid">
                      <button class="btn bsb-btn-xl btn-primary" type="submit">Sign up</button>
                      <div class="col-12">
                        <p class="m-0 text-secondary text-center">Already have an account? <a href="/login" class="link-primary text-decoration-none">Sign in</a></p>
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

































  
<!-- 



<center>
  <form action="/Register" method="post">
      Name: <input type="text" name="name"/>
      <br />
      <br>
      Email: <input type="text" name="email" />     <br>
      <br />
      Mobile: <input type="text" name="mobile" />     <br>
      <br />
      Password: <input type="text" name="password" />     <br>  
      <br />
      Role: <input type="radio" name="role" value="student" /> student
      
      <input type="radio" name="role" value="faculty" />Faculty
      <br>
      <input type="Submit" value="Register" />
    
  </form>
 
</center>
${msg} -->


























