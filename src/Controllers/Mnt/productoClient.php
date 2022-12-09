<?php

namespace Controllers\Mnt;

// ---------------------------------------------------------------
// Sección de imports
// ---------------------------------------------------------------
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Validators;
use Dao\Mnt\Productos as Productos;
use Dao\Mnt\Productos as DaoCategorias;

class productoClient extends PublicController
{
    private $viewData = array();
    private $arrModeDesc = array();
    private $arrCategorias = array();


    /**
     * Runs the controller
     *
     * @return void
     */
    public function run(): void
    {

        $this->init();

        if (!$this->isPostBack()) {
            $this->procesarGet();
        }

        $this->processView();
        Renderer::render('mnt/productoClient', $this->viewData);
    }

    private function init()
    {
        $this->viewData = array();
        $this->viewData["mode"] = "";
        $this->viewData["mode_desc"] = "";
        $this->viewData["crsf_token"] = "";
        $this->viewData["productId"] = "";

        $this->viewData["productname"] = "";
        $this->viewData["productnameArr"] = array();

        $this->viewData["catid"] = "";
        $this->viewData["catidArr"] = array();

        $this->viewData["productprice"] = "";
        $this->viewData["error_productprice"] = array();

        $this->viewData["proimg"] = "";


        $this->viewData["btnEnviarText"] = "Guardar";
        $this->viewData["readonly"] = false;
        $this->viewData["showBtn"] = true;

        $this->arrModeDesc = array(
            "INS" => "Producto Nuevo",
            "UPD" => "Editando %s %s",
            "DSP" => "Detalle de %s %s",
            "DEL" => "Eliminado %s %s"
        );

       /* $this->arrEstados = array(
            array("value" => "ACT", "text" => "Activo"),
            array("value" => "INA", "text" => "Inactivo"),
        );*/


        foreach (DaoCategorias::getAllC() as $key) {
            $this->arrCategorias[] = array("value" => $key["catid"], "text" => $key["productname"]);
        }

        $this->viewData["catidArr"] = $this->arrCategorias;
    
    }

    private function procesarGet()
    {
        if (isset($_GET["mode"])) {
            $this->viewData["mode"] = $_GET["mode"];
            if (!isset($this->arrModeDesc[$this->viewData["mode"]])) {
                error_log('Error: (Producto) Mode solicitado no existe.');
                \Utilities\Site::redirectToWithMsg(
                    "index.php?page=mnt_productos",
                    "No se puede procesar su solicitud!"
                );
            }
        }
        if ($this->viewData["mode"] !== "INS" && isset($_GET["id"])) {
            $this->viewData["productId"] = intval($_GET["id"]);
            $tmpProductos = DaoCategorias::getById($this->viewData["productId"]);
            error_log(json_encode($tmpProductos));
            \Utilities\ArrUtils::mergeFullArrayTo($tmpProductos, $this->viewData);
        }
    }

    private function processView()
    {
        if ($this->viewData["mode"] === "DSP") {
            $this->viewData["readonly"] = true;
            $this->viewData["showBtn"] = false;
        }
        $this->viewData["crsf_token"] = md5(getdate()[0] . $this->name);
        $_SESSION[$this->name . "crsf_token"] = $this->viewData["crsf_token"];
    }
}