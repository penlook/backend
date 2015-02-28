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

namespace App\Model;

use App\Model\Table\Widget;
use App\Model;

/**
 * Profile Model
 *
 * @category   Penlook Application
 * @package    App\Model
 * @copyright  Penlook Development Team
 * @license    GNU Affero General Public
 * @version    1.0
 * @link       http://github.com/penlook
 * @since      Class available since Release 1.0
 */
class ProfileModel extends Model
{
    /**
     * Constructor
     *
     * @author Tin Nguyen <tinntt@penlook.com>
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Get Widgets
     * This is get Widgets function
     *
     * @author Tin Nguyen <tinntt@penlook.com>
     * @return Array object
     */
    public function getWidgets()
    {
        return Widget::find([
            "enable = 1",
            "columns" : "id, name"
        ])->toArray();
    }
}