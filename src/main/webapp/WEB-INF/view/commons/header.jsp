<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Biblioteca</a>
        <button class="navbar-toggler" type="button"
            data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="${s:mvcUrl('PC#listAll').build()}">Produtos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${s:mvcUrl('CCC#itens').build()}">Carrinho (${carrinhoCompras.quantidade})</a>
                </li>
            </ul>
        </div>
    </nav>
</header>