<?php
namespace Controllers\Mnt;

use Controllers\PrivateController;

class Funciones extends PrivateController{
    public function run():void
    {
        $viewData = array();
       // $viewData["Funciones"] = DaoFunciones::getAll();

        \Views\Renderer::render("mnt/funciones", $viewData);
    }
}

?>
