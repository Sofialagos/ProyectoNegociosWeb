<?php

namespace Controllers\Mnt;


use Controllers\PublicController;
use Views\Renderer;

use Dao\Mnt\Productos; 


class Carrito extends PublicController
{
    private $viewData = array();
    
    public function run():void
    {
        $this->init();

        if (!$this->isPostBack()) {
            $this->procesarGet();
        }
        if ($this->isPostBack()) {
            $this->procesarPost();
        }               
        $this->processView();
        Renderer::render('mnt/carrito', $this->viewData);

        // Get the amount of items in the shopping cart, this will be displayed in the header.
//$num_items_in_cart = isset($_SESSION['cart']) ? count($_SESSION['cart']) : 0;
    }

    private function init()
    {
        $this->viewData = array();

        //prueba con productos
        // $this->viewData["productId"] = "";   
        // $this->viewData["invPrdBrCod"] = "";
        // $this->viewData["libCodInt"] = "";
        // $this->viewData["invPrdDsc"] = "";        
        // $this->viewData["invPrdTip"] = "";
        // $this->viewData["invPrdEst"] = "";
        // $this->viewData["invPrdVnd"] = "";
        //prueba con productos 


        if(!isset($_SESSION['CARRITO'])){
            $this->viewData["carrito"] = "";
            $this->viewData["total"] = "0";
        }else{
            $this->viewData["carrito"] = $_SESSION['CARRITO'];
            $total = 0;
            foreach ($_SESSION['CARRITO'] as $indice=>$producto){ //calcular suma total
                if($producto['Precio']){
                    $precio = intval($producto['Precio']);
                    $total += $precio;                    
                    $this->viewData["total"] = strval($total);
                }
            }
        }
    }




    //$conexion -> query("update products set stock =stock -".$arreglo[$i]['Cantidad']." where id=".$arreglo[$i]['Id'])or die($conexion->error);

    private function procesarGet()
    {
        if(!isset($_SESSION['CARRITO'])){
            $this->viewData["carrito"] = "";
            $this->viewData["total"] = "0";
        }else{
            $this->viewData["carrito"] = $_SESSION['CARRITO'];
            $total = 0;
            foreach ($_SESSION['CARRITO'] as $indice=>$producto){ //calcular suma total
                if($producto['Precio']){
                    $precio = intval($producto['Precio']);
                    $total += $precio;                    
                    $this->viewData["total"] = strval($total);
                }
            }
        }
    }

    private function procesarPost(){
        //verificar por id de producto y ya existe en el carrito
        //guardar en variuables para despues guardar en la session
        $encarro = false;
        if(isset($_POST['btnAccion'])){
            
            switch($_POST['btnAccion']) {
                case 'Agregar':
                    //verificar por id de producto y ya existe en el carrito
                    //guardar en variables para despues guardar en la session
                    //ver si existe en la base de datos
                    
                    //Esto es de productos cambair
                    $productoexiste = Productos::getById($_POST['productId']);
                    //Esto es de productos cambiar

                    if(is_array($productoexiste)){

                        if (!isset($_SESSION['CARRITO'])){
                            $producto = array(
                                'ID' => $productoexiste['productId'],         //Cambiar variables de productos
                                'Nombre producto' => $productoexiste['productname'],    //Cambiar variables de productos
                                'Codigo' => $productoexiste['productCodInt'], //Cambiar variables de productos
                                'Precio' => $productoexiste['productprice'],  //Cambiar variables de productos
                                'Categoria' => $productoexiste['catid']  //Cambiar variables de productos
                            );
                            $_SESSION['CARRITO'] [0] = $producto;
                            $this->viewData["carrito"] = $_SESSION['CARRITO'];
                        }
                        else{
                            $Existeproducto = count($_SESSION['CARRITO']);

                            foreach ($_SESSION['CARRITO'] as $indice=>$producto){
                                if($producto['ID']==$productoexiste['productId']){
                                    \Utilities\Site::redirectToWithMsg(
                                        "index.php?page=mnt_productosClient",
                                        "Ya esta en el carrito"
                                    );
                                    $encarro = true;
                                }
                            }
                            if(!$encarro){
                                $producto = array(
                                    'ID' => $productoexiste['productId'],         //Cambiar variables de productos
                                    'Nombre' => $productoexiste['productname'],    //Cambiar variables de productos
                                    'Codigo' => $productoexiste['productCodInt'], //Cambiar variables de productos
                                    'Precio' => $productoexiste['productprice'],  //Cambiar variables de productos
                                    'Categoria' => $productoexiste['catid']  //Cambiar variables de productos
                            );
                                $_SESSION['CARRITO'] [$Existeproducto] = $producto;
                                $this->viewData["carrito"] = $_SESSION['CARRITO'];
                            }
                            
                        }    
                    }
                    break;
                case 'Eliminar':
                    //verificar por id de producto y ya existe en el carrito
                    //guardar en variuables para despues guardar en la session
                    $id = $_POST['id'];
                    foreach ($_SESSION['CARRITO'] as $indice=>$producto){
                        if($producto['ID']==$id){
                            unset($_SESSION['CARRITO'][$indice]);
                            //print_r($_SESSION['CARRITO'][$indice]);
                            $this->viewData["carrito"] = $_SESSION['CARRITO'];
                                \Utilities\Site::redirectToWithMsg(
                                "index.php?page=mnt_carrito",
                                "Producto eliminado"
                            );
                        }
                    }
                    break;
                }
        }
    }
    
    private function processView()
    {
        
        if(!isset($_SESSION['CARRITO'])){
            $this->viewData["carrito"] = "";
            $this->viewData["total"] = "0";
        }else{
            $this->viewData["carrito"] = $_SESSION['CARRITO'];
            $total = 0;
            foreach ($_SESSION['CARRITO'] as $producto){ //calcular suma total
                if($producto['Precio']){
                    $precio = intval($producto['Precio']);
                    $total += $precio;                    
                    $this->viewData["total"] = strval($total);
                }
            }

        }
    }
    
}

?>