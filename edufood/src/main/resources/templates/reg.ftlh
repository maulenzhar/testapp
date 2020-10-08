<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Document</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<!-- Splash screen -->
<#import "/spring.ftl" as spring>
<#include "layout/main_layout.ftlh">
<section id="page-splash" class="page-splash">
    <div class="d-flex justify-content-center">
        <div class="mx-3">
            <h3><@spring.message "button.reg" /></h3>
            <form id="registration-form" method="post">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                </#if>
                <input name="email" type="text" class="form-control mb-1"  placeholder="<@spring.message "button.email" />" value="${(form.email)!''}" >
                <input name="name" type="text" class="form-control mb-1" placeholder="<@spring.message "button.name" />"  value="${(form.name)!''}">
                <input name="login" type="text" class="form-control mb-1"  placeholder="<@spring.message "button.login" />"  value="${(form.login)!''}">
                <input name="password" type="password" class="form-control mb-1"  placeholder="<@spring.message "button.password" />"  value="${(form.password)!''}">
                <button type="submit" class="btn btn-outline-primary btn-block"><@spring.message "button.register" /></button>
                <div>
                    <#if errors?? >
                        <p>Входные данные с ошибками!</p>
                        <#list errors as fieldError>
                            <p>${fieldError.field} - ${fieldError.defaultMessage!'-- no message --'}</p>
                        </#list>
                    </#if>
                </div>
            </form>
        </div>
    </div>
<#--    <script src="/js/reg.js"></script>-->
</section>
</body>
</html>