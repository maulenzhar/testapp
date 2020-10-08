<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Document</title>
</head>
<body>
<#--<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">-->
<#--    <a class="navbar-brand" href="http://localhost:8081/">EduFood</a>-->
<#--    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">-->
<#--        <span class="navbar-toggler-icon"></span>-->
<#--    </button>-->

<#--    <div class="collapse navbar-collapse" id="navbarsExampleDefault">-->
<#--        <ul class="navbar-nav mr-auto">-->
<#--            <li class="nav-item active">-->
<#--                <a class="nav-link" href="http://localhost:8081/">Home <span class="sr-only">(current)</span></a>-->
<#--            </li>-->
<#--            <li class="nav-item">-->
<#--                <a class="nav-link" href="#">Link</a>-->
<#--            </li>-->


<#--        </ul>-->
<#--        <form class="form-inline my-2 my-lg-0 mr-2"  id="formSearch" action="/search">-->
<#--            <input name="name" class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">-->
<#--            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="buttonSearch">Search</button>-->
<#--        </form>-->
<#--        <#if  dto??>-->
<#--            <button type="button" class="btn btn-outline-warning mr-2"><a href="/profile" class="link-yell">Profile</a></button>-->
<#--            <form class="flex box-128" action="/logout" method="post">-->
<#--                <#if _csrf??>-->
<#--                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>-->
<#--                </#if>-->
<#--                <button class="btn btn-outline-warning mr-2">Sign out</button>-->

<#--            </form>-->
<#--            <button class="btn btn-outline-warning mr-2">Cart</button>-->
<#--        <#else>-->
<#--            <button type="button" class="btn btn-outline-warning mr-2"><a href="/login" class="link-yell">Sign in</a> </button>-->
<#--            <button type="button" class="btn btn-outline-warning mr-2"><a href="/register" class="link-yell"> Sign up</a></button>-->

<#--        </#if>-->

<#--    </div>-->
<#--</nav>-->

<#include "layout/main_layout.ftlh">
<#include "layout/jumbotron_layout.ftlh">

<div class="container">


    <table class="table">
        <thead>

        <tr>
            <th scope="col">Product</th>
            <th scope="col">Price per one.</th>
            <th scope="col">Qty</th>
            <th scope="col">Total</th>

        </tr>
        </thead>
        <tbody>
        <#if cartItems??>
             <#list cartItems as item, val>
<#--                   <#list listOfFood as food>-->
        <tr>
            <td>
                <#if item.image??>
               <p><img src="/img/${item.image}"  class=" card-i"  alt="...">  ${item.name}</p>
                </#if>
            </td>
              <#if item.price??>
                <td>${item.price}</td>
              </#if>
            <td><input size="3" value="${val}" type="text"></td>

            <#assign orderTotal=val * item.price>
            <#if orderTotal??>
                <td>${orderTotal}</td>
            </#if>

        </tr>
                 </#list>
<#--             </#list>-->
        </#if>
        </tbody>
    </table>


    <#if cartItems??>

    <#--            <#list cartItems as item, val>-->
    <#--                <p>${item} - ${val}</p>-->
    <#--            </#list>-->

        <form action="/cart/empty" method="post">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <button>Очистить корзину</button>
        </form>
    <#else>
        <p>тут ничего нет!</p>
    </#if>
</div>
<footer class="container py-5">
    <div class="row">
        <div class="col-12 col-md">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mb-2" role="img" viewBox="0 0 24 24" focusable="false"><title>Product</title><circle cx="12" cy="12" r="10"></circle><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94"></path></svg>
            <small class="d-block mb-3 text-muted">© 2017-2019</small>
        </div>
        <div class="col-6 col-md">
            <h5>Features</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="#">Cool stuff</a></li>
                <li><a class="text-muted" href="#">Random feature</a></li>
                <li><a class="text-muted" href="#">Team feature</a></li>
                <li><a class="text-muted" href="#">Stuff for developers</a></li>
                <li><a class="text-muted" href="#">Another one</a></li>
                <li><a class="text-muted" href="#">Last time</a></li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <h5>Resources</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="#">Resource</a></li>
                <li><a class="text-muted" href="#">Resource name</a></li>
                <li><a class="text-muted" href="#">Another resource</a></li>
                <li><a class="text-muted" href="#">Final resource</a></li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <h5>Resources</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="#">Business</a></li>
                <li><a class="text-muted" href="#">Education</a></li>
                <li><a class="text-muted" href="#">Government</a></li>
                <li><a class="text-muted" href="#">Gaming</a></li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <h5>About</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="#">Team</a></li>
                <li><a class="text-muted" href="#">Locations</a></li>
                <li><a class="text-muted" href="#">Privacy</a></li>
                <li><a class="text-muted" href="#">Terms</a></li>
            </ul>
        </div>
    </div>
</footer>

<script src="js/script.js"></script>
</body>
</html>