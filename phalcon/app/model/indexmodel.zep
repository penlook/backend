/**
 * Penlook Project
 *
 * Copyright (c) 2015 Penlook Development Team
 *
 * --------------------------------------------------------------------
 *
 * This program is free software: you can redistribute it and/or
 * modify it under the terms of the GNU Affero General Public License
 * as published by the Free Software Foundation, either version 3
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public
 * License along with this program.
 * If not, see <http://www.gnu.org/licenses/>.
 *
 * --------------------------------------------------------------------
 *
 * Authors:
 *     Loi Nguyen       <loint@penlook.com>
 *     Tin Nguyen       <tinntt@penlook.com>
 *     Nam Vo           <namvh@penlook.com>
 */

namespace Phalcon\App\Model;

use Phalcon\App\Model\Table\User;
use Phalcon\App\Model;

/**
 * Index Model
 *
 * @category   Penlook Application
 * @package    App\Model
 * @copyright  Penlook Development Team
 * @license    GNU Affero General Public
 * @version    1.0
 * @link       http://github.com/penlook
 * @since      Class available since Release 1.0
 */
class IndexModel extends Model
{
    /**
     * IndexModel instance
     *
     * @author Tin Nguyen <tinntt@penlook.com>
     * @var IndexModel
     */
	private static static_index;

	/**
     * Get Instance
     * This is get instance function
     *
     * @author Tin Nguyen <tinntt@penlook.com>
     * @return IndexModel
     */
    public static function getInstance()
    {
        if (!self::static_index) {
            let self::static_index = new IndexModel();
        }

        return self::static_index;
    }

    /**
     * Get Users
     * This is get users function
     *
     * @author Tin Nguyen <tinntt@penlook.com>
     * @return Array Object
     */
    public function getUsers()
    {
        /*
        return User::find([
            "columns" : "name, email, alias"
        ])->toArray();
        */
    }
}