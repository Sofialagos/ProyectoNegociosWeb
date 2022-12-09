
<link rel="stylesheet" href="public/css2/bootstrap.min.css">
<script src="public/js/popper.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="public/css2/sweetalert2.min.css">

<link rel="stylesheet" href="/{{BASE_DIR}}/public/css/appstyle.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

<script src="https://kit.fontawesome.com/{{FONT_AWESOME_KIT}}.js" crossorigin="anonymous"></script>
{{foreach SiteLinks}}
<link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
{{endfor SiteLinks}}
{{foreach BeginScripts}}
<script src="/{{~BASE_DIR}}/{{this}}"></script>
{{endfor BeginScripts}}



<div class="container">
<div class="row align-items-stretch justify-content-between">
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="index.php?page=index">Tienda Elect</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
          aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
              <li class="nav-item dropdown">
                  <img src="public/imgs/cart.jpeg" class="nav-link dropdown-toggle img-fluid" height="70px"
                      width="70px" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true"
                      aria-expanded="false"></img>
                  <div id="carrito" class="dropdown-menu" aria-labelledby="navbarCollapse">
                      <table id="lista-carrito" class="table">
                          <thead>

                            <a href="index.php?page=mnt_productosClient" id="productId" class="btn btn-primary btn-block">Vaciar Carrito</a>
                            <a href="index.php?page=mnt_cart"procesar-pedido" class="btn btn-danger btn-block">Procesar Compra</a>

                              <tr>
                                
                                  <th>Imagen</th>
                                  <th>Nombre</th>
                                  <th>Precio</th>
                                  <th></th>
                              </tr>

                              {{foreach Productos}}
                                    <tr>
                                        <td><img src="{{proimg}}" alt="{{productname}}" class="w-20"  width="50" height="70"></td>
                                        <td>{{productname}}</td>
                                        <td>{{productprice}}</td>
                                     
                                    </tr>
                                 {{endfor Productos}}
                          </thead>
                          <tbody></tbody>
                      </table>

                      <a href="#" id="vaciar-carrito" class="btn btn-primary btn-block">Vaciar Carrito</a>
                      <a href="index.php?page=mnt_cart"procesar-pedido" class="btn btn-danger btn-block">Procesar Compra</a>
                  </div>


            

                  
              </li>
          </ul>
      </div>
  </nav>
</div>
</div>
<section>
<div class="text-center container py-5">
  <h2 class="mt-4 mb-5"><strong>Productos</strong></h2>
  
</div>




</section>

<script src="public/js/jquery-3.4.1.min.js"></script>
<script src="public/js/bootstrap.min.js"></script>
<script src="public/js/sweetalert2.min.js"></script>
<script src="public/js/carrito.js"></script>
<script src="public/js/pedido.js"></script>





<div class="link-icons">

    <a href="index.php?page=mnt_carrito">
        <i class="fas fa-shopping-cart"></i>
    </a>
</div>


<div class="row">
    {{foreach Productos}}
    <div class="col-lg-4 col-md-6 mb-4">
        <div class="card" style="margin: 2rem;">
            <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
                data-mdb-ripple-color="light">
                <img src="{{proimg}}" alt="{{productname}}" class="w-100"
                    width="200" height="300" style="position: center;">
                <div class="card-body">
                  <!--  <a href="index.php?page=Mnt-productoClient&mode=DSP&id={{productId}}" class="text-reset"> -->
                       <font color="purple"> <h3 class="card-title mb-3" style="font-size: 20px" >{{productname}}</h3>  </font>
                    </a>
                   <!--  <p style="text-color: gray">{{productname}}</p> -->
                  

                    <h5 class="mb-3"> Precio: {{productprice}}</h5>
                    <h5 class="mb-3"> Disponibles: {{stock}}</h5>


                    <form action="index.php?page=mnt_carrito" method="POST">
                        <input type="hidden" name="productId" id="productId" value="{{productId}}" />
                        <button name="btnAccion" value="Agregar" type="submit">Agregar al carrito</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    {{endfor Productos}}
</div>