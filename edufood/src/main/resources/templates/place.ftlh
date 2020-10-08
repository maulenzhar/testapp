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
<#import "/spring.ftl" as spring>
<#include "layout/main_layout.ftlh">
<#include "layout/jumbotron_layout.ftlh">

<div class="container">
<#--    <h1>${place.name}</h1>-->
<#--    <div class="row row-cols-1 row-cols-md-3" id="itemList">-->
<#--        <#list items as f>-->
<#--            <div class="col mb-4">-->
<#--                <div class="card h-100  text-center">-->
<#--                    <#if f.image??>-->
<#--                        <img src="/img/${p.image}" class=" card-i" alt="${p.name}">-->
<#--                    </#if>-->
<#--                    <div class="card-body" >-->
<#--                        <h5 class="card-title">${f.name}</h5>-->
<#--                        <#if f.descriptions??>-->
<#--                            <p class="card-text">${f.descriptions}</p>-->
<#--                        </#if>-->
<#--                        <#if f.price??>-->
<#--                            <p class="card-text">${f.price} с.</p>-->
<#--                        </#if>-->
<#--                        <a href="#" class="btn btn-primary" >Order now</a>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </div>-->
<#--        </#list>-->

<#--    </div>-->
<#--    <table class="table">-->
<#--        <thead>-->
<#--        <tr>-->
<#--            <th scope="col">Food</th>-->
<#--        </tr>-->
<#--        </thead>-->
<#--        <tbody>-->
<#--        <#if place??>-->
<#--            <#list place as f>-->
<#--                <#if f?index == 0>-->
<#--                    <h3>${f.place.name}</h3>-->
<#--                </#if>-->
<#--                <tr>-->
<#--                    <td>-->
<#--                        ${f.food.name}-->
<#--                        <#if f.food.price??>-->
<#--                          ${f.food.price} c.-->
<#--                        </#if>-->
<#--                    </td>-->
<#--                    <#if  dto??>-->
<#--                    <td>-->
<#--                        <form action="/cart/add" method="post" id="cart-form">-->
<#--                            <#if _csrf??>-->
<#--                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>-->
<#--                            </#if>-->
<#--                            <input type="hidden" name="value" value=" ${f.food.name}"/>-->
<#--&lt;#&ndash;                                <button type="submit">Добавить в корзину</button>&ndash;&gt;-->
<#--                            <a href="" id="cart-add" >Добавить в корзину</a>-->
<#--                        </form>-->

<#--                    </td>-->
<#--                    </#if>-->
<#--                </tr>-->

<#--            </#list>-->
<#--        </#if>-->
<#--        </tbody>-->
<#--    </table>-->

    <div class="row row-cols-1 row-cols-md-3" id="itemList">
        <#list place as f>
                <#if f?index == 0>
                    <h3>${f.place.name}</h3>
                </#if>
                <div class="col mb-4">
                    <div class="card h-100  text-center">
                        <h5 class="card-title"> ${f.food.name}</h5>
                   <#if  f.food.image??>
                       <img src="/img/${f.food.image}" height="100px" width="100px" class=" card-i"  alt="...">
                    </#if>
                        <div class="card-body" >
                   <#if f.food.price??>
                            <h5 class="card-title"> ${f.food.price} c.</h5>
                    </#if>
                    <#if  dto??>
                            <form action="/cart/add" method="post" id="cart-form">
                                <#if _csrf??>
                                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                </#if>
                                <input type="hidden" name="value" value="${f.food.id}"/>
                                        <button type="submit">Добавить в корзину</button>
<#--                                <a href="" id="cart-add" >Добавить в корзину</a>-->
                            </form>
                        </#if>
                        </div>
                    </div>
                </div>
        </#list>
    </div>


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

<script src="/js/cart.js"></script>
</body>
</html>