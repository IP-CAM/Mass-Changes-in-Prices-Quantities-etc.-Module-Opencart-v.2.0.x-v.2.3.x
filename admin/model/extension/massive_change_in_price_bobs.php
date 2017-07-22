<?php
/**
 * Class ModelExtensionMassiveChangeInPriceBobs
 * @author  Bobs
 * @license GPL
 */
class ModelExtensionMassiveChangeInPriceBobs extends Model
{

    public function setProductPrice($product_id, $price)
    {
        $this->db->query(
            "UPDATE " . DB_PREFIX .
            "product SET price=" . (int)$price .
            " WHERE product_id=" . (int)$product_id
        );
    }

    public function setProductOptionPrice($product_option_value_id, $price_option)
    {
        $this->db->query(
            "UPDATE " . DB_PREFIX .
            "product_option_value SET price=" . (int)$price_option .
            " WHERE product_option_value_id=" . (int)$product_option_value_id
        );
    }


}


?>