/*
 +------------------------------------------------------------------------+
 | Phalcon Framework                                                      |
 +------------------------------------------------------------------------+
 | Copyright (c) 2011-2014 Phalcon Team (http://www.phalconphp.com)       |
 +------------------------------------------------------------------------+
 | This source file is subject to the New BSD License that is bundled     |
 | with this package in the file docs/LICENSE.txt.                        |
 |                                                                        |
 | If you did not receive a copy of the license and are unable to         |
 | obtain it through the world-wide-web, please send an email             |
 | to license@phalconphp.com so we can send you a copy immediately.       |
 +------------------------------------------------------------------------+
 | Authors: Andres Gutierrez <andres@phalconphp.com>                      |
 |          Eduar Carvajal <eduar@phalconphp.com>                         |
 +------------------------------------------------------------------------+
 */

namespace Phalcon\Mvc\View;

use Phalcon\DiInterface;
use Phalcon\Di\Injectable;
use Phalcon\Mvc\ViewInterface;

/**
 * Phalcon\Mvc\View\Engine
 *
 * All the template engine adapters must inherit this class. This provides
 * basic interfacing between the engine and the Phalcon\Mvc\View component.
 */
abstract class Engine extends Injectable
{

	protected _view;

	/**
	 * Phalcon\Mvc\View\Engine constructor
	 *
	 * @param Phalcon\Mvc\ViewInterface view
	 * @param Phalcon\DiInterface dependencyInjector
	 */
	public function __construct(view, <DiInterface> dependencyInjector = null)
	{
		let this->_view = view;
		let this->_dependencyInjector = dependencyInjector;
	}

	/**
	 * Returns cached ouput on another view stage
	 *
	 * @return string
	 */
	public function getContent() -> string
	{
		return this->_view->getContent();
	}

	/**
	 * Renders a partial inside another view
	 *
	 * @param string partialPath
	 * @param array params
	 * @return string
	 */
	public function partial(string! partialPath, params = null) -> string
	{
		return this->_view->partial(partialPath, params);
	}

	/**
	 * Returns the view component related to the adapter
	 *
	 * @return Phalcon\Mvc\ViewInterface
	 */
	public function getView() -> <ViewInterface>
	{
		return this->_view;
	}
}