<?php
 namespace Controllers\Mnt;

// ---------------------------------------------------------------
// Sección de imports
// ---------------------------------------------------------------
use Controllers\PublicController;
use Dao\Mnt\Productos as DaoProductos;
use Views\Renderer;


class productosClient extends PublicController
{
    public function run():void
    {
        // code
        $viewData = array();
        $viewData["Productos"] = DaoProductos::getAll();
        error_log(json_encode($viewData));
      
        Renderer::render('mnt/productosClient', $viewData);
    }
}

?>