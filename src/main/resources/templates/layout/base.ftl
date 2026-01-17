<#macro layout>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>${title!""}</title>
</head>
<body>

<header>
    <h1>${header!""}</h1>
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
