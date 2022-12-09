<?php

 namespace Controllers\Mnt;

// ---------------------------------------------------------------
// Sección de imports
// ---------------------------------------------------------------
use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Validators;
use Dao\Mnt\Productos as DaoProductos;



class Producto extends PrivateController
{
    private $viewData = array();
    private $arrModeDesc = array();
    private $arrEstados = array();
    private $arrCategorias = array();


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
        Renderer::render('mnt/producto', $this->viewData);
    }

    private function init()
    {
        $this->viewData = array();
        $this->viewData["mode"] = "";
        $this->viewData["mode_desc"] = "";
        $this->viewData["crsf_token"] = "";
        $this->viewData["productId"] = "";

        $this->viewData["productId"] = "";
        $this->viewData["productname"] = "";
        $this->viewData["error_productname"] = array();
       
        $this->viewData["catid"] = "";
        $this->viewData["catidArr"] = array();
      
      
        
        $this->viewData["productprice"] ="";
        $this->viewData["error_productprice"] = array();



        $this->viewData["productCodInt"] ="";
        $this->viewData["error_productCodInt"] = array();

        $this->viewData["proimg"] ="";
        $this->viewData["error_proimg"] = array();

        $this->viewData["stock"] ="";
        $this->viewData["error_stock"] = array();



       

      
        $this->viewData["btnEnviarText"] = "Guardar";
        $this->viewData["readonly"] = false;
        $this->viewData["showBtn"] = true;

        $this->arrModeDesc = array(
            "INS"=>"Nuevo Producto",
            "UPD"=>"Editando el producto %s %s",
            "DSP"=>"Detalle de producto %s %s",
            "DEL"=>"Eliminando producto %s %s"
        );

      /*  $this->arrEstados = array(
            array("value" => "ACT", "text" => "Activo"),
            array("value" => "INA", "text" => "Inactivo"),
        );*/

        
        foreach (\Dao\Mnt\categorias::getAll() as $key){
            $this->arrCategorias[] = array("value" => $key["catid"],"text" => $key["catproduct"]);
        }
        

        $this->viewData["catidArr"] = $this->arrCategorias;
        //$this->viewData["editidArr"] = $this->arrEditoriales;
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
            $tmpProductos = DaoProductos::getById($this->viewData["productId"]);
            error_log(json_encode($tmpProductos));
            \Utilities\ArrUtils::mergeFullArrayTo($tmpProductos, $this->viewData);
        }
    }
    private function procesarPost()
    {
        // Validar la entrada de Datos
        $hasErrors = false;
        \Utilities\ArrUtils::mergeArrayTo($_POST, $this->viewData);
        if (isset($_SESSION[$this->name . "crsf_token"])
            && $_SESSION[$this->name . "crsf_token"] !== $this->viewData["crsf_token"]
        ) {
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=mnt_productos",
                "ERROR: Algo inesperado sucedió con la petición Intente de nuevo."
            );
        }

        
        if (Validators::IsEmpty($this->viewData["productname"])) {
            $this->viewData["error_productname"][]
                = "La nombre es requerido";
            $hasErrors = true;
        }


        if (Validators::IsEmpty($this->viewData["productprice"])) {
            $this->viewData["error_productprice"][]
                = "El precio es requerido";
            $hasErrors = true;
        }

       

        if (Validators::IsEmpty($this->viewData["productCodInt"])) {
            $this->viewData["error_productCodInt"][]
                = "El código de barra es requerido";
            $hasErrors = true;
        }

        if (!isset($_FILES["proimg"])) {
            $this->viewData["error_proimg"][]
                = "La imagen es requerida";
            $hasErrors = true;
            
        }

            else{               
                $target_dir = "uploads/";
                $target_file = $target_dir . basename($_FILES["proimg"]["name"]);

                $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
                move_uploaded_file($_FILES["proimg"]["tmp_name"], $target_file);
                $this->viewData["proimg"]=$target_file;
            }


            if (Validators::IsEmpty($this->viewData["stock"])) {
                $this->viewData["error_stock"][]
                    = "El stock es requerido";
                $hasErrors = true;
            }
       

        error_log(json_encode($this->viewData));
        
        if (!$hasErrors) {
            $result = null;
            switch($this->viewData["mode"]) {
            case 'INS':
                $result = DaoProductos::insert(
                    $this->viewData["productname"],
                    $this->viewData["catid"],
                    $this->viewData["productprice"],
                    $this->viewData["productCodInt"],
                    $this->viewData["proimg"],
                    $this->viewData["stock"],

                    
                );
                if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=mnt_productos",
                            "Producto Guardado Satisfactoriamente!"
                        );
                }
                break;
            case 'UPD':
                $result = DaoProductos::update(
                    $this->viewData["productname"],
                    $this->viewData["catid"],
                    $this->viewData["productprice"],
                    $this->viewData["productCodInt"],
                    $this->viewData["proimg"],
                    $this->viewData["stock"],

            
                    intval($this->viewData["productId"])
                );
                if ($result) {
                    \Utilities\Site::redirectToWithMsg(
                        "index.php?page=mnt_productos",
                        "Producto Actualizado Satisfactoriamente"
                    );
                }
                break;
            case 'DEL':
                $result = DaoProductos::delete(
                    intval($this->viewData["productId"])
                );
                if ($result) {
                    \Utilities\Site::redirectToWithMsg(
                        "index.php?page=mnt_productos",
                        "Producto Eliminado Satisfactoriamente"
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
            $this->viewData["btnEnviarText"] = "Guardar Nuevo";
        } else {
            $this->viewData["mode_desc"]  = sprintf(
                $this->arrModeDesc[$this->viewData["mode"]],
                $this->viewData["productId"],
                $this->viewData["productname"]
            );
      

                $this->viewData["catidArr"]
                = \Utilities\ArrUtils::objectArrToOptionsArray(
                    $this->arrCategorias,
                    'value',
                    'text',
                    'value',
                    $this->viewData["catid"]
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
