<?php

namespace Dao\Mnt;
use Dao\Table;

class carrito extends Table
{
    public static function getAll()
    {
        $sqlstr = "Select * from carritos;";
        return self::obtenerRegistros($sqlstr, array());
    }
    
    public static function getById(int $idcarrito)
    {
        $sqlstr = "SELECT * from `carritos` where idcarrito=:idcarrito;";
        $sqlParams = array("idcarrito" => $idcarrito);
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }

    public static function insert(
        $cantidad,
        $cantidadTotal,
    ) {
        $sqlstr = "INSERT INTO `carritos` (`cantidad`)
                    VALUES (:cantidad);";
        $sqlParams = [
            "cantidad" => $cantidad ,
            "cantidadTotal" => $cantidadTotal 
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }
    
    public static function update(
        $cantidad,
        $cantidadTotal,
        $idcarrito
    ) {
        $sqlstr = "UPDATE `carritos` set `cantidad`=:cantidad
                    where `idcarrito` = :idcarrito;";
        $sqlParams = array(
            "cantidad" => $cantidad,
         "CantidadTotal" => $cantidadTotal,
            "idcarrito" => $idcarrito
        );
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function delete($idcarrito)
    {
        $sqlstr = "DELETE from `carritos` where idcarrito = :idcarrito;";
        $sqlParams = array(
            "idcarrito" => $idcarrito
        );
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

}