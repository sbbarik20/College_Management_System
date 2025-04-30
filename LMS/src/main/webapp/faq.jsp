<jsp:include page="menu.jsp" />

<style>
.bg-light {
  margin-top: 72px;
}
</style>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- FAQ 1 - Bootstrap Brain Component -->
<section class=" bg-light py-3 py-md-5">
  <div class="container">
    <div class="row gy-5 gy-lg-0 align-items-lg-center">
      <div class="col-12 col-lg-6">
        <img src="images/faq.png" class="img-fluid rounded" loading="lazy" >
      </div>
      <div class="col-12 col-lg-6"> 
        <div class="row justify-content-xl-end">
          <div class="col-12 col-xl-11">
            <h2 class="h1 mb-3">How can we help you?</h2>
            <p class="lead fs-4 text-secondary mb-5">We hope you have found an answer to your question. If you need any help, please search your query on our Support Center or contact us via email.</p>
            
            <c:forEach var="faqlist" items="${faqlist}" >
            <div class="accordion accordion-flush" id="accordionExample">
              <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    ${faqlist.question}
                  </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                  <div class="accordion-body">
                    <p>${faqlist.answer}</p>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>