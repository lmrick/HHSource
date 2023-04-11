package com.sulake.habbo.avatar.actions
{
   import com.sulake.core.utils.class_24;
   import flash.utils.Dictionary;
   
   public class ActionDefinition implements IActionDefinition
   {
       
      
      private var var_247:String;
      
      private var var_159:String;
      
      private var var_4185:int;
      
      private var var_3822:String;
      
      private var _assetPartDefinition:String;
      
      private var var_4014:String;
      
      private var var_2165:String;
      
      private var _isMain:Boolean = false;
      
      private var _isDefault:Boolean = false;
      
      private var _isAnimation:Boolean = false;
      
      private var var_4012:Boolean = false;
      
      private var var_3282:Array;
      
      private var var_3530:Boolean;
      
      private var var_2087:class_24;
      
      private var var_1474:Dictionary;
      
      private var _params:Dictionary;
      
      private var var_3948:String = "";
      
      public function ActionDefinition(param1:XML)
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc4_:String = null;
         var_3282 = [];
         var_1474 = new Dictionary();
         _params = new Dictionary();
         super();
         var_247 = String(param1.@id);
         var_159 = String(param1.@state);
         var_4185 = parseInt(param1.@precedence);
         var_3822 = String(param1.@activepartset);
         _assetPartDefinition = String(param1.@assetpartdefinition);
         var_4014 = String(param1.@lay);
         var_2165 = String(param1.@geometrytype);
         _isMain = Boolean(parseInt(param1.@main));
         _isDefault = Boolean(parseInt(param1.@isdefault));
         _isAnimation = Boolean(parseInt(param1.@animation));
         var_4012 = param1.@startfromframezero == "true";
         var_3530 = param1.@preventheadturn == "true";
         var _loc3_:String = String(param1.@prevents);
         if(_loc3_ != "")
         {
            var_3282 = _loc3_.split(",");
         }
         for each(var _loc2_ in param1.param)
         {
            _loc6_ = String(_loc2_.@id);
            _loc7_ = String(_loc2_.@value);
            if(_loc6_ == "default")
            {
               var_3948 = _loc7_;
            }
            else
            {
               _params[_loc6_] = _loc7_;
            }
         }
         for each(var _loc5_ in param1.type)
         {
            _loc4_ = String(_loc5_.@id);
            var_1474[_loc4_] = new ActionType(_loc5_);
         }
      }
      
      public function setOffsets(param1:String, param2:int, param3:Array) : void
      {
         if(var_2087 == null)
         {
            var_2087 = new class_24();
         }
         if(var_2087.getValue(param1) == null)
         {
            var_2087.add(param1,new class_24());
         }
         var _loc4_:class_24;
         (_loc4_ = var_2087.getValue(param1)).add(param2,param3);
      }
      
      public function getOffsets(param1:String, param2:int) : Array
      {
         if(var_2087 == null)
         {
            return null;
         }
         var _loc3_:class_24 = var_2087.getValue(param1) as class_24;
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getValue(param2) as Array;
      }
      
      public function getParameterValue(param1:String) : String
      {
         if(param1 == "")
         {
            return "";
         }
         var _loc2_:String = "null";
         if(_loc2_ == null)
         {
            _loc2_ = var_3948;
         }
         return _loc2_;
      }
      
      private function getTypePrevents(param1:String) : Array
      {
         if(param1 == "")
         {
            return [];
         }
         var _loc2_:ActionType = var_1474[param1];
         if(_loc2_ != null)
         {
            return _loc2_.prevents;
         }
         return [];
      }
      
      public function toString() : String
      {
         return "[ActionDefinition]\nid:           " + id + "\n" + "state:        " + state + "\n" + "main:         " + isMain + "\n" + "default:      " + isDefault + "\n" + "geometry:     " + state + "\n" + "precedence:   " + precedence + "\n" + "activepartset:" + activePartSet + "\n" + "activepartdef:" + assetPartDefinition + "";
      }
      
      public function get id() : String
      {
         return var_247;
      }
      
      public function get state() : String
      {
         return var_159;
      }
      
      public function get precedence() : int
      {
         return var_4185;
      }
      
      public function get activePartSet() : String
      {
         return var_3822;
      }
      
      public function get isMain() : Boolean
      {
         return _isMain;
      }
      
      public function get isDefault() : Boolean
      {
         return _isDefault;
      }
      
      public function get assetPartDefinition() : String
      {
         return _assetPartDefinition;
      }
      
      public function get lay() : String
      {
         return var_4014;
      }
      
      public function get geometryType() : String
      {
         return var_2165;
      }
      
      public function get isAnimation() : Boolean
      {
         return _isAnimation;
      }
      
      public function getPrevents(param1:String = "") : Array
      {
         return var_3282.concat(getTypePrevents(param1));
      }
      
      public function getPreventHeadTurn(param1:String = "") : Boolean
      {
         if(param1 == "")
         {
            return var_3530;
         }
         var _loc2_:ActionType = var_1474[param1];
         if(_loc2_ != null)
         {
            return _loc2_.preventHeadTurn;
         }
         return var_3530;
      }
      
      public function isAnimated(param1:String) : Boolean
      {
         if(param1 == "")
         {
            return true;
         }
         var _loc2_:ActionType = var_1474[param1];
         if(_loc2_ != null)
         {
            return _loc2_.isAnimated;
         }
         return true;
      }
      
      public function get startFromFrameZero() : Boolean
      {
         return var_4012;
      }
      
      public function get params() : Dictionary
      {
         return _params;
      }
   }
}
