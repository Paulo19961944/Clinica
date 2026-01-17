<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>${title!""}</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>

<header>
    <h1>${header!""}</h1>
</header>

<main>
    <#-- Bloco de conteúdo das páginas -->
    <#nested>
</main>

<footer>
    <p>${footer!""}</p>
</footer>

<script src="/static/js/app.js"></script>
</body>
</html>
