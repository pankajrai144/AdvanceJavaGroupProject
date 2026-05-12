<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="xsChecked" value="" />
<c:set var="sChecked" value="" />
<c:set var="mChecked" value="" />
<c:set var="lChecked" value="" />
<c:set var="xlChecked" value="" />
<c:set var="xxlChecked" value="" />

<c:forEach var="sizeValue" items="${fn:split(product.size, ',')}">
  <c:if test="${fn:trim(sizeValue) == 'XS'}">
    <c:set var="xsChecked" value="checked" />
  </c:if>
  <c:if test="${fn:trim(sizeValue) == 'S'}">
    <c:set var="sChecked" value="checked" />
  </c:if>
  <c:if test="${fn:trim(sizeValue) == 'M'}">
    <c:set var="mChecked" value="checked" />
  </c:if>
  <c:if test="${fn:trim(sizeValue) == 'L'}">
    <c:set var="lChecked" value="checked" />
  </c:if>
  <c:if test="${fn:trim(sizeValue) == 'XL'}">
    <c:set var="xlChecked" value="checked" />
  </c:if>
  <c:if test="${fn:trim(sizeValue) == 'XXL'}">
    <c:set var="xxlChecked" value="checked" />
  </c:if>
</c:forEach>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Product | Jersey Pasal</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
:root {
  --primary: #8b0d1f;
  --primary-dark: #5f0715;
  --bg: #0f0f0f;
  --card: #1a1a1a;
  --text: #ffffff;
  --subtext: #b8b8b8;
  --border: #333;
  --input-bg: #111;
  --success: #1f8f4d;
  --error: #c0392b;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  background: var(--bg);
  color: var(--text);
  min-height: 100vh;
  padding: 30px 15px;
}

.upload-card {
  background: var(--card);
  width: 100%;
  max-width: 720px;
  margin: 0 auto;
  padding: 32px;
  border-radius: 18px;
  border: 1px solid var(--border);
  box-shadow: 0 12px 35px rgba(0, 0, 0, 0.45);
}

.page-header {
  text-align: center;
  margin-bottom: 24px;
}

.page-header h2 {
  font-size: 30px;
  margin-bottom: 8px;
  color: var(--text);
}

.subtitle {
  color: var(--subtext);
  font-size: 15px;
}

.profile-section {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 22px;
}

.image-preview-grid {
  width: 100%;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 12px;
  margin-bottom: 15px;
}

.profile-preview {
  width: 100%;
  aspect-ratio: 1 / 1;
  border-radius: 12px;
  background: #111;
  border: 2px dashed #444;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.profile-preview img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.profile-preview i {
  font-size: 28px;
  color: #888;
}

.product-name {
  margin-top: 12px;
  font-size: 18px;
  color: var(--text);
}

.product-team {
  margin-top: 4px;
  font-size: 14px;
  color: var(--subtext);
}

.file-box {
  width: 100%;
  margin-top: 16px;
  text-align: center;
}

.file-box input[type="file"] {
  display: none;
}

.upload-btn {
  width: 100%;
  min-height: 58px;
  border: 2px dashed var(--primary);
  border-radius: 14px;
  background: #111;
  color: #ffffff;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  cursor: pointer;
  font-size: 15px;
  font-weight: bold;
  transition: 0.3s ease;
}

.upload-btn:hover {
  background: #241015;
  border-color: #ff4d6d;
  color: #ffccd5;
}

.input-group {
  margin-bottom: 15px;
}

.input-group label {
  color: var(--subtext);
  font-size: 14px;
  display: block;
  margin-bottom: 7px;
}

.input-group input,
.input-group select,
.input-group textarea {
  width: 100%;
  padding: 13px 14px;
  border-radius: 12px;
  border: 1px solid var(--border);
  background: var(--input-bg);
  color: var(--text);
  outline: none;
  font-size: 15px;
}

.input-group textarea {
  resize: vertical;
  min-height: 85px;
}

.input-group input:focus,
.input-group select:focus,
.input-group textarea:focus {
  border-color: var(--primary);
  box-shadow: 0 0 0 2px rgba(139, 13, 31, 0.25);
}

.size-checkbox-group {
  background: var(--input-bg);
  border: 1px solid var(--border);
  border-radius: 12px;
  padding: 12px;
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
}

.size-checkbox-group label {
  cursor: pointer;
  margin: 0;
}

.size-checkbox-group input {
  display: none;
}

.size-checkbox-group span {
  display: inline-block;
  min-width: 48px;
  text-align: center;
  padding: 10px 12px;
  border-radius: 8px;
  background: #1a1a1a;
  border: 1px solid var(--border);
  color: var(--subtext);
  font-size: 13px;
  font-weight: bold;
}

.size-checkbox-group input:checked + span {
  background: var(--primary);
  border-color: var(--primary);
  color: #ffffff;
}

.btn-submit {
  width: 100%;
  background: var(--primary);
  color: #fff;
  padding: 13px;
  border-radius: 30px;
  border: none;
  margin-top: 8px;
  cursor: pointer;
  font-size: 15px;
  font-weight: bold;
}

.btn-submit:hover {
  background: var(--primary-dark);
}

.back-link {
  color: var(--subtext) !important;
  text-decoration: none;
  font-size: 14px;
  display: block;
  text-align: center;
  margin-top: 20px;
}

.back-link:hover {
  color: #fff !important;
}

@media (max-width: 600px) {
  body {
    padding: 20px 12px;
  }

  .upload-card {
    padding: 24px 18px;
  }

  .page-header h2 {
    font-size: 25px;
  }

  .image-preview-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
</style>
</head>

<body>

<div class="upload-card">

  <div class="page-header">
    <h2>Edit Product</h2>
    <p class="subtitle">Update jersey product details</p>
  </div>

  <form action="${pageContext.request.contextPath}/editproduct" method="post" enctype="multipart/form-data">

    <input type="hidden" name="productId" value="${product.productId}">
    <input type="hidden" name="existingImage" value="${product.productImage}">
    <input type="hidden" name="existingImage2" value="${product.productImage2}">
    <input type="hidden" name="existingImage3" value="${product.productImage3}">
    <input type="hidden" name="existingImage4" value="${product.productImage4}">

    <div class="profile-section">
      <div class="image-preview-grid">

        <div class="profile-preview">
          <c:choose>
            <c:when test="${not empty product.productImage}">
              <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage}" alt="Product Image">
            </c:when>
            <c:otherwise>
              <i class="fa-solid fa-image"></i>
            </c:otherwise>
          </c:choose>
        </div>

        <div class="profile-preview">
          <c:choose>
            <c:when test="${not empty product.productImage2}">
              <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage2}" alt="Product Image">
            </c:when>
            <c:otherwise>
              <i class="fa-solid fa-image"></i>
            </c:otherwise>
          </c:choose>
        </div>

        <div class="profile-preview">
          <c:choose>
            <c:when test="${not empty product.productImage3}">
              <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage3}" alt="Product Image">
            </c:when>
            <c:otherwise>
              <i class="fa-solid fa-image"></i>
            </c:otherwise>
          </c:choose>
        </div>

        <div class="profile-preview">
          <c:choose>
            <c:when test="${not empty product.productImage4}">
              <img src="${pageContext.request.contextPath}/getimage?productImage=${product.productImage4}" alt="Product Image">
            </c:when>
            <c:otherwise>
              <i class="fa-solid fa-image"></i>
            </c:otherwise>
          </c:choose>
        </div>

      </div>

      <h3 class="product-name">${product.jerseyName}</h3>
      <p class="product-team">${product.teamName}</p>

      <div class="file-box">
        <input type="file" id="productImages" name="productImages" accept="image/*" multiple>
        <label for="productImages" class="upload-btn">
          <i class="fa-solid fa-cloud-arrow-up"></i>
          <span>Upload 4 New Product Images</span>
        </label>
      </div>
    </div>

    <div class="input-group">
      <label>Jersey Name</label>
      <input type="text" name="jerseyName" value="${product.jerseyName}">
    </div>

    <div class="input-group">
      <label>Team Name</label>
      <input type="text" name="teamName" value="${product.teamName}">
    </div>

    <div class="input-group">
      <label>Available Sizes</label>

      <div class="size-checkbox-group">
        <label>
          <input type="checkbox" name="size" value="XS" ${xsChecked}>
          <span>XS</span>
        </label>

        <label>
          <input type="checkbox" name="size" value="S" ${sChecked}>
          <span>S</span>
        </label>

        <label>
          <input type="checkbox" name="size" value="M" ${mChecked}>
          <span>M</span>
        </label>

        <label>
          <input type="checkbox" name="size" value="L" ${lChecked}>
          <span>L</span>
        </label>

        <label>
          <input type="checkbox" name="size" value="XL" ${xlChecked}>
          <span>XL</span>
        </label>

        <label>
          <input type="checkbox" name="size" value="XXL" ${xxlChecked}>
          <span>XXL</span>
        </label>
      </div>
    </div>

    <div class="input-group">
      <label>Season</label>
      <input type="text" name="season" value="${product.season}">
    </div>

    <div class="input-group">
      <label>Price</label>
      <input type="number" step="0.01" name="price" value="${product.price}">
    </div>

    <div class="input-group">
      <label>Stock Quantity</label>
      <input type="number" name="stockQuantity" value="${product.stockQuantity}">
    </div>

    <div class="input-group">
      <label>Category</label>
      <select name="category">
        <option value="">Select Category</option>
        <option value="Club" ${product.category == 'Club' ? 'selected' : ''}>Club</option>
        <option value="Nation" ${product.category == 'Nation' ? 'selected' : ''}>Nation</option>
      </select>
    </div>

    <div class="input-group">
      <label>Description</label>
      <textarea name="description">${product.description}</textarea>
    </div>

    <button type="submit" class="btn-submit">
      <i class="fa-solid fa-floppy-disk"></i> Save Changes
    </button>

  </form>

  <a href="${pageContext.request.contextPath}/admindashboard" class="back-link">
    <i class="fa-solid fa-arrow-left-long"></i> Back to Admin Dashboard
  </a>

</div>

</body>
</html>