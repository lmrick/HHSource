package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.core.window.class_1683;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3303;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.utils.CommunicationUtils;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   
   public class LoginEnvironmentsController extends EventDispatcherWrapper
   {
      
      public static const ENVIRONMENT_SELECTED_EVENT:String = "ENVIRONMENT_SELECTED_EVENT";
       
      
      private var var_2585:class_19;
      
      private var _windowManager:class_1683;
      
      private var var_3578:class_21;
      
      private var var_4245:class_3127;
      
      private var var_2164:int;
      
      private var var_1773:class_3303;
      
      private var var_3346:String;
      
      public function LoginEnvironmentsController(param1:class_3303, param2:class_19, param3:class_1683, param4:class_21)
      {
         super();
         var_2585 = param2;
         _windowManager = param3;
         var_3578 = param4;
         var_1773 = param1;
         init();
      }
      
      public function get selectedEnvironment() : String
      {
         return var_3346;
      }
      
      override public function dispose() : void
      {
         var_1773 = null;
         super.dispose();
      }
      
      private function getAvailableEnvironments() : Array
      {
         return var_2585.getProperty("live.environment.list").split("/");
      }
      
      private function createListItem(param1:String) : class_3127
      {
         var _loc2_:XmlAsset = var_3578.getAssetByName(param1) as XmlAsset;
         return _windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function init() : void
      {
         var _loc5_:int = 0;
         var _loc6_:class_3151 = null;
         var_4245 = createListItem("login_environment_list_item");
         var _loc3_:Array = getAvailableEnvironments();
         var _loc1_:String = CommunicationUtils.readSOLString("environment");
         _loc1_ = _loc1_ == null ? "d63" : _loc1_;
         var _loc4_:Array = getEnvironmentNames(_loc3_);
         var_3346 = _loc1_;
         var _loc7_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc7_)
         {
            var_1773.removeMenuItemAt(0);
            _loc5_++;
         }
         for each(var _loc2_ in _loc4_)
         {
            (_loc6_ = var_4245.clone() as class_3151).findChildByName("title").caption = _loc2_;
            var_1773.addMenuItem(_loc6_);
         }
         var_1773.selection = _loc3_.indexOf(_loc1_);
         var_1773.procedure = dropMenuEventHandler;
         var_2164 = -1;
         testEnvironmentAvailable(false);
      }
      
      private function testEnvironmentAvailable(param1:Boolean) : void
      {
         var environmentIds:Array;
         var window:class_3151;
         var environment:String;
         var host:String;
         var ports:Array;
         var socket:Socket;
         var lastEnvironmentConnected:Boolean = param1;
         if(_disposed || var_1773 == null || false)
         {
            return;
         }
         environmentIds = getAvailableEnvironments();
         if(var_1773 && var_2164 > -1 && var_2164 < var_1773.numMenuItems)
         {
            window = var_1773.getMenuItemAt(var_2164) as class_3151;
            (window.findChildByName("icon") as IStaticBitmapWrapperWindow).assetUri = lastEnvironmentConnected ? "help_accept_icon" : "help_decline_icon";
         }
         var_2164++;
         if(var_2164 >= environmentIds.length)
         {
            return;
         }
         environment = "null";
         host = String(var_2585.getProperty("connection.info.host." + environment));
         ports = var_2585.getProperty("connection.info.port." + environment).split(",");
         socket = new Socket();
         socket.addEventListener("connect",function(param1:Event):void
         {
            (param1.target as Socket).close();
            testEnvironmentAvailable(true);
         });
         socket.addEventListener("complete",function(param1:Event):void
         {
            (param1.target as Socket).close();
         });
         socket.addEventListener("close",function(param1:Event):void
         {
            (param1.target as Socket).close();
         });
         socket.addEventListener("socketData",function(param1:ProgressEvent):void
         {
            (param1.target as Socket).close();
         });
         socket.addEventListener("securityError",function(param1:SecurityErrorEvent):void
         {
            (param1.target as Socket).close();
            testEnvironmentAvailable(false);
         });
         socket.addEventListener("ioError",function(param1:IOErrorEvent):void
         {
            (param1.target as Socket).close();
            testEnvironmentAvailable(false);
         });
         socket.connect(host,ports[0]);
      }
      
      private function getEnvironmentNames(param1:Array) : Array
      {
         var _loc3_:* = [];
         for each(var _loc2_ in param1)
         {
            _loc3_.push(getEnvironmentName(_loc2_));
         }
         return _loc3_;
      }
      
      public function getEnvironmentName(param1:String) : String
      {
         var _loc3_:* = param1;
         var _loc2_:String = "connection.info.name." + param1;
         if(var_2585.propertyExists(_loc2_))
         {
            _loc3_ = String(var_2585.getProperty(_loc2_));
         }
         else
         {
            class_14.log("Could not find name for environment: " + param1);
         }
         return _loc3_;
      }
      
      private function dropMenuEventHandler(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WE_SELECTED")
         {
            return;
         }
         var _loc4_:Array = getAvailableEnvironments();
         var _loc5_:int = 0;
         var _loc3_:String = String(_loc4_[_loc5_]);
         var_3346 = _loc3_;
         dispatchEvent(new Event("ENVIRONMENT_SELECTED_EVENT"));
         param1.stopPropagation();
         param1.stopImmediatePropagation();
      }
   }
}
