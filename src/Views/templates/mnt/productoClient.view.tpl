<section>

    <h1>{{productname}}</h1>
    <img src="/uploads/{{proimg}}" alt="{{productname}}" height="500" width="300">
    &nbsp;
    <h3> {{productprice}}</h3>
    <form action="index.php?page=mnt_carrito" method="POST">
        <input type="hidden" name="productId" id="productId" value="{{productId}}" />
        <button name="btnAccion" value="Agregar" type="submit">Agregar al carrito</button>
    </form>

</section>