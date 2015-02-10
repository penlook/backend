/*
 +--------------------------------------------------------------------------+
 | Penlook Project                                                          |
 +--------------------------------------------------------------------------+
 | Copyright (c) 2015 Penlook Development Team                              |
 +--------------------------------------------------------------------------+
 |                                                                          |
 | This program is free software: you can redistribute it and/or modify     |
 | it under the terms of the GNU Affero General Public License as           |
 | published by the Free Software Foundation, either version 3 of the       |
 | License, or (at your option) any later version.                          |
 |                                                                          |
 | This program is distributed in the hope that it will be useful, but      |
 | WITHOUT ANY WARRANTY; without even the implied warranty of               |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            |
 | GNU Affero General Public License for more details.                      |
 |                                                                          |
 | You should have received a copy of the GNU Affero General Public License |
 | along with this program.  If not, see <http://www.gnu.org/licenses/>.    |
 |                                                                          |
 +--------------------------------------------------------------------------+
 |   Authors: Loi Nguyen  <loint@penlook.com>                               |
 |            Tin Nguyen  <tinntt@penlook.com>                              |
 |            Nam Vo      <namvh@penlook.com>                               |
 +--------------------------------------------------------------------------+
*/

namespace App;

use Phalcon\Mvc\Application;

/**
 * App Configuration
 *
 * @category   Penlook Application
 * @package    App\Config
 * @copyright  Penlook Development Team
 * @license    GNU Affero General Public
 * @version    1.0
 * @link       http://github.com/penlook
 * @since      Class available since Release 1.0
 */
class App
{

    /**
     * Debug Mode
     */
    const DEBUG    = 0;

    /**
     * Production mode
     */
    const RELEASE  = 1;

    /**
     * Maintain mode
     */
    const MAINTAIN = 2;

    /**
     * Configuration
     *
     * @var App\Config
     */
    private config;

    /**
     * Service
     *
     * @var App\Service
     */
    private service;

    /**
     * Loader
     *
     * @var App\Loader
     */
    private loader;

    /**
     * Session
     *
     * @var Phalcon\Session\Adapter\Files
     */
    private session;

    /**
     * Service
     *
     * @var Phalcon\Mvc\Application
     */
    private application;

    /**
     * Logger
     *
     * @var App\Log
     */
    private logger;

    /**
     * Web page
     *
     * @var string
     */
    private html;

    /**
     * Temporary property
     */
    public debug;

    /**
     * Mode
     *
     * @var int
     */
    public static mode;

    /**
     * Application Constructor
     *
     */
    public inline function __construct()
    {
        Flow::start();
    }

    /**
     * Initialize application
     *
     * @return App\App
     */
    public inline function initialize()
    {
        let this->config  = Config ::getInstance();
        let this->service = Service::getInstance();
        let this->session = Service::getSession();

        switch self::mode {
            case self::DEBUG:
                    this->setupDebug();
                break;
            case self::RELEASE:
                    this->setupRelease();
                break;
            case self::MAINTAIN:
                    this->setupMaintain();
                break;
            default:
                break;
        }

        return this;
    }

    /**
     * Setup for development mode
     *
     */
    public inline function setupDebug()
    {
        this->session->set("mode", App::DEBUG);
        error_reporting(E_ALL);
        ini_set("display_errors", true);
    }

    /**
     * Setup for production mode
     *
     */
    public inline function setupRelease()
    {
        this->session->set("mode", App::RELEASE);
        error_reporting(0);
        ini_set("display_errors", false);
    }

    /**
     * Setup for maintain mode
     *
     */
    public inline function setupMaintain()
    {
        this->session->set("mode", App::MAINTAIN);
        // TODO
    }

    public inline function setLogger(logger)
    {
        let this->logger = logger;
        return this;
    }

    public inline function getLogger()
    {
        return this->logger;
    }

    /**
     * Set mode
     * Switch mode for application
     *
     * @param int mode
     */
    public inline function setMode(mode)
    {
        let self::mode = mode;

        // Initialize application by mode
        this->initialize();

        return this;
    }

    /**
     * Change current mode
     *
     * @return int
     */
    public inline static function changeMode(mode)
    {
        let self::mode = mode;
    }

    /**
     * Get mode
     * Retrieve current mode of application
     *
     * @return int
     */
    public inline static function getMode()
    {
        return self::mode;
    }

    /**
     * Check debug mode
     *
     */
    public inline static function debug()
    {
        return self::mode === self::DEBUG ? true : false;
    }

    /**
     * Get service
     * Retrieve current service container
     *
     * @return Phalcon\DI\FactoryDefault
     */
    public inline function getService()
    {
        return this->service;
    }

    /**
     * Set multiple services
     *
     * @param function callback
     * @return App\App
     */
    public inline function setServices(callback)
    {
        call_user_func_array(callback, [ this->getListServices() ]);
        return this;
    }

    /**
     * Set single service
     *
     * @return App\App
     */
    public inline function setService(name, closure)
    {
        this->getService()->getService()->set(name, closure);
        return this;
    }

    /**
     * Get list services
     * Retrieve all service are already registered
     *
     * @return array
     */
    public inline function getListServices()
    {
        return [
            "url"               : Service::getUrl(),
            "config"            : Service::getConfig(),
            "router"            : Service::getRouter(),
            "cookie"            : Service::getCookie(),
            "crypt"             : Service::getCrypt(),
            "redis"             : Service::getRedis(),
            "view"              : Service::getView(),
            "session"           : Service::getSession(),
            "mysql"             : Service::getMySQL(),
            "mongo"             : Service::getMongoDB(),
            "collectionManager" : Service::getCollectionManager()
        ];
    }

    /**
     * Set loader
     *
     * @return App\App
     */
    public inline function setLoader(loader)
    {
        let this->loader = loader;
        return this;
    }

    /**
     * Get loader
     * Retrieve application loader
     *
     * @return App\Loader
     */
    public inline function getLoader()
    {
        return this->loader;
    }

    /**
     * Set application instance
     *
     * @param Phalcon\Mvc\Application app
     * @return App\App
     */
    public inline function setApplication(app)
    {
        let this->application = app;
        return this;
    }

    /**
     * Get application instance
     *
     * @return Phalcon\Mvc\Application
     */
    public inline function getApplication()
    {
        return this->application;
    }

    /**
     * Set root
     * Set current root path where application will be runned
     *
     * @param string root
     * @return App\App
     */
    public inline function setRoot(root)
    {
        this->config->setRoot(root);

        // Initialize configuration
        this->config->initialize();

        return this;
    }

    /**
     * Get rooot
     *
     * @return string
     */
    public inline function getRoot()
    {
        return this->config->getRoot();
    }

    /**
     * Start application
     *
     */
    public inline function start()
    {
        this->setLoader(new Loader())
            ->setApplication(new Application(this->service->getService()));

        let this->html = this->getApplication()->handle()->getContent();
        return this;
    }

    public inline function watch()
    {

    }

    /**
     * Measure application running time
     *
     * @return App\App
     */
    public inline function measure()
    {
        /*var time, memory;
        let time = (double) (this->stop * 1000.000000) - (double) (this->start * 1000.000000);
        let time = (string) time;

        let memory = memory_get_usage();

        // Override HTML content
        let this->html  = "Running time : " . time . " ms <br/>";
        let this->html  = this->html . "Memory : " . memory;
        */
        return this;
    }

    /**
     * Get HTML Page
     *
     * @return string
     */
    public inline function html()
    {
        return this->html;
    }

}