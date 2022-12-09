<?php

namespace Dao\Mnt;
use Dao\Table;

class categorias extends Table
{
    public static function getAll()
    {
        $sqlstr = "Select * from categorias;";
        return self::obtenerRegistros($sqlstr, array());
    }
    
    public static function getById(int $catid)
    {
        $sqlstr = "SELECT * from `categorias` where catid=:catid;";
        $sqlParams = array("catid" => $catid);
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }

    public static function insert(
        $catproduct,
     //   $catest,
    ) {
        $sqlstr = "INSERT INTO `categorias` (`catproduct`)
                    VALUES (:catproduct);";
        $sqlParams = [
            "catproduct" => $catproduct ,
           // "catest" => $catest 
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }
    
    public static function update(
        $catproduct,
    //    $catest,
        $catid
    ) {
        $sqlstr = "UPDATE `categorias` set `catproduct`=:catproduct
                    where `catid` = :catid;";
        $sqlParams = array(
            "catproduct" => $catproduct,
        // "catest" => $catest,
            "catid" => $catid
        );
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function delete($catid)
    {
        $sqlstr = "DELETE from `categorias` where catid = :catid;";
        $sqlParams = array(
            "catid" => $catid
        );
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

}