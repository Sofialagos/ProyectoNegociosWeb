<?php
namespace Dao\Mnt;

use Dao\Table;


class Productos extends Table
{

    public static function getAll()
    {
        $sqlstr = "Select * from productos;";
        return self::obtenerRegistros($sqlstr, array());
    }
    
    public static function getById(int $productId)
    {
        $sqlstr = "SELECT * from `productos` where productId=:productId;";
        $sqlParams = array("productId" => $productId);
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }

    
 

    public static function insert(
        $productname,
        $catid,
        $productprice,
        $productCodInt,
        $proimg,
    ) {
        $sqlstr = "INSERT INTO `productos`
        ( `productname`,`catid`,`productprice`, `productCodInt`, `proimg`)
        VALUES
        (:productname, :catid, :productprice, :productCodInt, :proimg)";
        $sqlParams = [
            "productname" => $productname ,
            "catid" => $catid ,
            "productprice" => $productprice ,
            "productCodInt" => $productCodInt ,
            "proimg" => $proimg ,
  
            
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }
    

    public static function update(
        $productname,
        $catid,
        $productprice,
        $productCodInt,
        $proimg,
        $stock,
        $productId

    ) {
        $sqlstr = "UPDATE `productos` set `productname`=:productname, `catid`=:catid,`productprice`=:productprice, `productCodInt`=:productCodInt,`proimg`=:proimg, `stock`=:stock
                    where `productId` = :productId;";
        $sqlParams = array(
            "productname" => $productname,
            "catid" => $catid,
            "productprice" => $productprice,
            "productCodInt" => $productCodInt,
            "proimg" => $proimg,
            "stock" => $stock,
            "productId" => $productId
        );
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    
    public static function delete($productId)
    {
        $sqlstr = "DELETE from `productos` where productId = :productId;";
        $sqlParams = array(
            "productId" => $productId
        );
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

   
}