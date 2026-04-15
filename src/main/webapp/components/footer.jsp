<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<style>

/* FOOTER */
.footer {
  background: #f9f9f9;
  padding: 60px;
  margin-top: 60px;
  border-top: 1px solid #eee;
}

/* GRID */
.footer-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px,1fr));
  gap: 30px;
}

/* COLUMN TITLE */
.footer-col h4 {
  margin-bottom: 15px;
  font-size: 16px;
}

/* LINKS */
.footer-col a {
  display: block;
  margin-bottom: 8px;
  color: #555;
  text-decoration: none;
  font-size: 14px;
}

.footer-col a:hover {
  color: black;
}

/* INPUT */
.footer-col input {
  width: 100%;
  padding: 10px;
  border-radius: 8px;
  border: 1px solid #ddd;
  margin-bottom: 10px;
  outline: none;
}

/* BUTTON */
.footer-col button {
  width: 100%;
  padding: 10px;
  border: none;
  background: black;
  color: white;
  border-radius: 8px;
  cursor: pointer;
}

.footer-col button:hover {
  opacity: 0.9;
}

/* BOTTOM */
.footer-bottom {
  border-top: 1px solid #ddd;
  margin-top: 30px;
  padding-top: 20px;
  text-align: center;
  font-size: 13px;
  color: #555;
}

/* RESPONSIVE */
@media (max-width: 768px) {
  .footer-container {
    grid-template-columns: 1fr;
    text-align: center;
  }
}

</style>

<!-- FOOTER HTML -->
<footer class="footer">

  <div class="footer-container">

    <div class="footer-col">
      <h4>Company</h4>
      <a href="about.jsp">About Us</a>
      <a href="#">Blog</a>
      <a href="#">Contact Us</a>
    </div>

    <div class="footer-col">
      <h4>Shop</h4>
      <a href="#">Shop All Product</a>
      <a href="#">World Cup Jerseys 2026</a>
    </div>

    <div class="footer-col">
      <h4>Customer Support</h4>
      <a href="#">Returns & Refunds Policy</a>
      <a href="#">Shipping Policy</a>
      <a href="#">Privacy Policy</a>
    </div>

    <div class="footer-col">
      <h4>Join us for updates</h4>
      <input type="email" placeholder="Enter your email">
      <button>Subscribe</button>
    </div>

  </div>

  <div class="footer-bottom">
    <p><strong>KTHREE INC.</strong></p>
    <p>Orlando, FL</p>
    <p>© 2026 PrimeJerseys</p>
  </div>

</footer>

<!-- OPTIONAL SCRIPT -->
<script>
let c = 0;
function add(){
  c++;
  document.getElementById("count").innerText = c;
}
</script>