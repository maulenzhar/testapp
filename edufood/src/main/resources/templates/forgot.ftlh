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
<section id="page-splash" class="page-splash">
    <div class="d-flex justify-content-center">
        <div class="mx-3">
            <h2>Please enter email to reset password</h2>
            <div>
                <form action="/forgot-password" method="post">

                    <#if _csrf??>
                        <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                    </#if>

                    <div>
                        <label class="flex flex-v-center">
                            <p class="label-input-text">Адрес почты:</p>
                            <input type="text" name="email" placeholder="ваш адрес почты" >
                        </label>
                    </div>
                    <div>
                        <button type="submit">Отправить</button>
                    </div>
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
            <div class="bottom-box">
                <a href="/">На главную страницу</a>
            </div>
        </div>
    </div>

</section>


</body>
</html>