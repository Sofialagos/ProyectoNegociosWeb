<?php
 namespace Controllers\Mnt;

// ---------------------------------------------------------------
// Sección de imports
// ---------------------------------------------------------------
use Controllers\PrivateController;
use Dao\Mnt\Productos as DaoProductos;
use Views\Renderer;


class Productos extends PrivateController
{
    public function run():void
    {
        // code
        $viewData = array();
        $viewData["Productos"] = DaoProductos::getAll();
        error_log(json_encode($viewData));
      
        Renderer::render('mnt/productos', $viewData);
    }
}

?>