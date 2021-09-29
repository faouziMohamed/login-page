<%@tag description="User connected layout page" pageEncoding='UTF-8' %>
<%@attribute name="title" required="true" %>
<%@attribute name="client" type='com.mybank.model.Client' required="true" %>

<html>
<head>
  <jsp:include page="src/main/webapp/WEB-INF/components/head-meta.jsp" />
  <link rel="stylesheet"
        type="text/css"
        href="${pageContext.request.contextPath}/public/styles/dashboard.css">
  <link
   rel="stylesheet"
   type="text/css"
   href="${pageContext.request.contextPath}/public/styles/login.css"
  />
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/public/styles/userCard.css">
  <title>${title}</title>
</head>
<body>
<main class="main-content">
  <header class="main-header">
    <nav class="main-navbar">
      <div class="burger-container">
        <input type="checkbox" id="checkbox-input" class="checkbox-input" />
        <label class="menu-btn" for="checkbox-input"></label>
        <label for="checkbox-input" class="menu-btn-text">
          Available operations
        </label>
      </div>
      <ul class="main-op main-menu closed">
        <c:set var="contextPath" scope="page" />
        <li class="main-op-item">
          <a href="${contextPath}/currentAccounts" class="operation-link">
            <i class="fad fa-coins"></i>
            Current accounts
          </a>
        </li>
        <li class="main-op-item">
          <a href="${contextPath}/savingAccounts" class="operation-link">
            <i class="fad fa-piggy-bank"></i>
            Saving accounts
          </a>
        </li>
        <li class="main-op-item">
          <a href="${contextPath}/transfer" class="operation-link">
            <i class="fad fa-envelope-open-dollar"></i>
            Make a transfer
          </a>
        </li>
        <li class="main-op-item">
          <a href="${contextPath}/logout" class="operation-link logout">
            <i class="fad fa-sign-out-alt"></i>
            Logout
          </a>
        </li>
      </ul>
    </nav>
  </header>

  <section class="main-section">
    <header class="user-header top-center-header">
      <nav class="menu" aria-label="menu">
        <div class="scaled-profile-pic-wrapper">
          <img
           alt="User profile picture"
           class="user-profile-picture-scaled"
           src="${pageContext.request.contextPath}/public/images/coder.gif"
           title="${client.username}'s profile picture"
           width="40" />
          <i class="fas fa-sort-down sort-down"></i></div>
        <div class="wrapper hidden">
          <div class="top-arrow"></div>
          <div class="user-profile">
            <figure class="user-figure">
              <div class="user-picture-wrapper">
                <img
                 src="${pageContext.request.contextPath}/public/images/coder.gif"
                 alt="User profile picture"
                 class="user-picture"
                 width="138"
                 height="138"
                />
              </div>
              <figcaption class="user-name">
                <c:out value="${client.firstName} ${client.lastName}" />
              </figcaption>
            </figure>
          </div>
          <nav class="user-actions-wrapper">
            <ul class="action-wrapper">
              <li class="actions-item">
                <a href="${pageContext.request.contextPath}/dashboard"
                   class="action-item-link">
                  <i class="far fa-user-alt"></i>
                  Dashboard
                </a>
              </li>
              <li class="actions-item">
                <a href="${pageContext.request.contextPath}/myaccount"
                   class="action-item-link">
                  <i class="far fa-user-alt"></i>
                  Account
                </a>
              </li>
              <li class="actions-item">
                <a href="${pageContext.request.contextPath}/notifs"
                   class="action-item-link">
                  <i class="fas fa-bell"></i>
                  Notifications
                </a>
              </li>
              <li class="actions-item">
                <a href="${pageContext.request.contextPath}/logout"
                   class="action-item-link">
                  <i class="fad fa-sign-out"></i>
                  Logout
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </nav>
    </header>
    <jsp:doBody />
  </section>
</main>

</body>
</html>
