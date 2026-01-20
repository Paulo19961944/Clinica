<#macro layout>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>${title!""}</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<header>
    <img src="/img/logo.png" id="logo" />
    <nav>
        <ul>
            <li><a>Home</a></li>
            <li><a>Quem Somos</a></li>
            <li><a>Agendamentos</a></li>
            <li><a>Contato</a></li>
        </ul>
    </nav>
</header>

<main>
    <#nested>
</main>

<footer>
    <p>${footer!""}</p>
</footer>

</body>
</html>
</#macro>
