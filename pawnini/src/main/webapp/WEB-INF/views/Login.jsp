<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="style/Login.css" />
    <link rel="stylesheet" href="style/main.css" />
  </head>
   <%@ include file="include/Header.jsp" %>
  <body>
 

    <h1>공사중</h1>
    <div class="Form">
      <h1 class="Form_title">Login</h1>
      <input class="Form_Login" type="text" placeholder="User Name" />
      <input
        class="Form_Password"
        type="password"
        placeholder="User password"
      />
      <button class="button_Login">Login</button>
      <h3 class="Form_SignUP"><a href="signUp.html">Sign Up</a></h3>
    </div>

  <%@ include file="include/Footer.jsp" %> 

  </body>
</html>
