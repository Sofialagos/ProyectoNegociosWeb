<?php
 namespace Controllers\Mnt;

// ---------------------------------------------------------------
// Sección de imports
// ---------------------------------------------------------------
use Controllers\PrivateController;
use Dao\Mnt\Usuarios as DaoUsuarios;
use Views\Renderer;

class Usuarios extends PrivateController
{
    public function run():void
    {
        // code
        $viewData = array();
        $viewData["Usuarios"] = DaoUsuarios::getAll();

        //$viewData["Usuarios"] = \Dao\Security\Security::getUsuarios();
        $viewData["CanInsert"] = self::isFeatureAutorized("Controllers\Mnt\Usuario\New");
        $viewData["CanUpdate"] = self::isFeatureAutorized("Controllers\Mnt\Usuario\Upd");
        $viewData["CanDelete"] = self::isFeatureAutorized("Controllers\Mnt\Usuario\Del");
        $viewData["CanView"] = self::isFeatureAutorized("Controllers\Mnt\Usuario\Dsp");


        error_log(json_encode($viewData));
      
        Renderer::render('mnt/usuarios', $viewData);
    }
}

?>
