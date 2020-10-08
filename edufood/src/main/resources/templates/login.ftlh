<#import "/spring.ftl" as spring>
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
<!-- Splash screen -->
<!-- Splash screen -->
<#include "layout/main_layout.ftlh">
<section id="page-splash" class="page-splash">
    <div class="d-flex justify-content-center">
        <div class="mx-3">
<#--            <#if logout>-->
<#--                <div class="alert alert-info" role="alert">You`ve been logged out</div>-->
<#--            </#if>-->
<#--            <#if error>-->
<#--                <div class="alert alert-danger" role="alert">Invalid username or password</div>-->
<#--            </#if>-->

<#--            action="/login"-->
            <form id="login-form" method="post" >
                <h3><@spring.message "button.signintoedu" /></h3>
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                </#if>
                <input type="text" name="username" class="form-control mb-1" placeholder="<@spring.message "button.email" />">
                <input type="password" name="password" class="form-control mb-1" placeholder="<@spring.message "button.password" />">
                <button type="submit" class="btn btn-outline-primary btn-block">Sign in</button>
<#--                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />-->
                <a class="flex box-128" href="/forgot-password"> <@spring.message "button.forgetpass" /> </a>
            </form>
        </div>
    </div>

</section>


</body>
</html>