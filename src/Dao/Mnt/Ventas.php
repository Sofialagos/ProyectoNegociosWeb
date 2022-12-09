<?php

namespace Dao\Mnt;

use Dao\Table;

class Ventas extends Table
{

    public static function getAll()
    {
        $sqlstr = "select * from ventas";
        return self::obtenerRegistros($sqlstr, array());
    }

    public static function getById(int $Ventaid)
    {
        $sqlstr = "SELECT * from `ventas` where Ventaid=:Ventaid;";
        $sqlParams = array("Ventaid" => $Ventaid);
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }


    public static function insert(
        $fechaventa,
        $productoVendido,
        $monto
    ) {
        $sqlstr = "INSERT INTO `ventas`
(`fechaventa`, `productoVendido`, `monto`)
VALUES
(:fechaventa, :productoVendido, :monto);";
        $sqlParams = [
            "fechaventa" => $fechaventa,
            "productoVendido" => $productoVendido,
            "monto" => $monto 
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function update(
        $Ventaid,
        $fechaventa,
        $productoVendido,    
        $monto
    ) {
        $sqlstr = "UPDATE `ventas` set
        `fechaventa`=:fechaventa, `productoVendido`=:productoVendido,`monto`=:monto
        where `Ventaid` = :Ventaid;";
        $sqlParams = array(
            "Ventaid"=> $Ventaid,
            "fechaventa"=> $fechaventa,
            "productoVendido"=>$productoVendido,
            "monto"=>$monto
        );
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function delete($Ventaid)
    {
        $sqlstr = "DELETE from `ventas` where Ventaid = :Ventaid;";
        $sqlParams = array(
            "Ventaid" => $Ventaid
        );
        return self::executeNonQuery($sqlstr, $sqlParams);
    }
}