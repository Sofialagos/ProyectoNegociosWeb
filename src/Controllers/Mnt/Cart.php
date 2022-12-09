<?php

namespace Controllers\Mnt;   

// ---------------------------------------------------------------
use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Validators;
use Dao\Mnt\cart as DaoCart;
use Exception;


class Carts extends PrivateController
{
    
    public function run():void
    {
        // code
        $viewData = array();
        $viewData["carts"] = DaoCart::getAll();
        error_log(json_encode($viewData));

        Renderer::render('mnt/cart', $viewData);
    }
}



class Cart extends PrivateController
{
   private $viewData = array();
   private $arrModeDesc = array();
   private $arrEstados = array();
   
   public function run():void
   {
       // code
       $this->init();
       // Cuando es método GET (se llama desde la lista)
       if (!$this->isPostBack()) {
           $this->procesarGet();
       }
       // Cuando es método POST (click en el botón)
       if ($this->isPostBack()) {
           $this->procesarPost();
       }
       // Ejecutar Siempre
       $this->processView();
       Renderer::render('mnt/cart', $this->viewData);
   }
   private function init()
   {
       $this->viewData = array();
       $this->viewData["mode"] = "";
       $this->viewData["mode_desc"] = "";
       $this->viewData["crsf_token"] = "";
       $this->viewData["idcarrito"] = "";
       $this->viewData["cantidad"] = "";
       $this->viewData["cantidadTotal"] = "";
       $this->viewData["btnEnviarText"] = "Guardar";
       $this->viewData["readonly"] = false;
       $this->viewData["showBtn"] = true;

       $this->arrModeDesc = array(
           "INS"=>"Nuevo cart",
           "UPD"=>"Editando %s %s",
           "DSP"=>"Detalle de %s %s",
           "DEL"=>"Eliminado %s %s"
       );

     
   
   }
   private function procesarGet()
   {
       if (isset($_GET["mode"])) {
           $this->viewData["mode"] = $_GET["mode"];
           if (!isset($this->arrModeDesc[$this->viewData["mode"]])) {
               error_log('Error: (Cart) Mode solicitado no existe.');
               \Utilities\Site::redirectToWithMsg(
                   "index.php?page=mnt_carts",
                   "No se puede procesar su solicitud!"
               );
           }
       }
       if ($this->viewData["mode"] !== "INS" && isset($_GET["idcarrito"])) {
           $this->viewData["idcarrito"] = intval($_GET["idcarrito"]);
           $tmpCarts= DaoCart::getById($this->viewData["idcarrito"]);
           error_log(json_encode($tmpCarts));
           \Utilities\ArrUtils::mergeFullArrayTo($tmpCarts, $this->viewData);
       }
   }

   private function procesarPost()
   {
   
       $hasErrors = false;
       \Utilities\ArrUtils::mergeArrayTo($_POST, $this->viewData);

       if (isset($_SESSION[$this->name . "crsf_token"])
           && $_SESSION[$this->name . "crsf_token"] !== $this->viewData["crsf_token"]
       ) {
           \Utilities\Site::redirectToWithMsg(
               "index.php?page=mnt_carts",
               "ERROR: Algo inesperado sucedió con la petición Intente de nuevo."
           );
       }

     

      

       error_log(json_encode($this->viewData));
       // Ahora procedemos con las modificaciones al registro
       if (!$hasErrors) {
           $result = null;
           switch($this->viewData["mode"]) {
           case 'INS':
               $result = DaoCart::insert(
                  
                   $this->viewData["cantidad"],
                  // $this->viewData["cantidadTotal"],
                   null,
                  // 1,
               );
               if ($result) {
                       \Utilities\Site::redirectToWithMsg(
                           "index.php?page=mnt_carts",
                           "Guardado  Satisfactoriamente!"
                       );
               }
               break;
           case 'UPD':
               $result = DaoCart::update(
                
                   $this->viewData["cantidad"],
                   $this->viewData["cantitadTotal"],
                   $this->viewData["idcarrito"],

                   intval($this->viewData["idcarrito"])
   
               );
               if ($result) {
                   \Utilities\Site::redirectToWithMsg(
                       "index.php?page=mnt_carts",
                       "cart Actualizado Satisfactoriamente"
                   );
               }
               break;
           case 'DEL':
               $result = DaoCart::delete(
                   intval($this->viewData["idcarrito"])
               );
               if ($result) {
                   \Utilities\Site::redirectToWithMsg(
                       "index.php?page=mnt_carts",
                       "cart Eliminado Satisfactoriamente"

                   );
               }
               break;
           }
       }
   }
   private function processView()
   {
       if ($this->viewData["mode"] === "INS") {
           $this->viewData["mode_desc"]  = $this->arrModeDesc["INS"];
           $this->viewData["btnEnviarText"] = "Guardar Nueva";
       } else {
           $this->viewData["mode_desc"]  = sprintf(
               $this->arrModeDesc[$this->viewData["mode"]],
               $this->viewData["idcarrito"],
           );
         
         
         
           if ($this->viewData["mode"] === "DSP") {
               $this->viewData["readonly"] = true;
               $this->viewData["showBtn"] = false;
           }
           if ($this->viewData["mode"] === "DEL") {
               $this->viewData["readonly"] = true;
               $this->viewData["btnEnviarText"] = "Eliminar";
           }
           if ($this->viewData["mode"] === "UPD") {
               $this->viewData["btnEnviarText"] = "Actualizar";
           }
       }
       $this->viewData["crsf_token"] = md5(getdate()[0] . $this->name);
       $_SESSION[$this->name . "crsf_token"] = $this->viewData["crsf_token"];
   }
}
