/*
 * Copyright (C) 2014 Penlook
 *                    Vietnam
 *                    http://www.penlook.com
 *                    support@penlook.com
 *
 * Authors:
 *  Loi Nguyen <loint@penlook.com>
 *
 */
namespace App;

use Phalcon\Mvc\Model as Phalcon_Model;

/**
 * Application Table
 *
 * @category   Penlook Application
 * @package    App\Config
 * @author     Loi Nguyen <loint@penlook.com>
 * @copyright  Penlook Development Team
 * @license    Commercial
 * @version    1.0
 * @link       http://penlook.com
 * @since      Class available since Release 1.0
 */
class Table extends Phalcon_Model

{
	/**
     * Initialize Table
     *
     */
    public inline function initialize()
    {
        this->setConnectionService("mysql");
    }
}