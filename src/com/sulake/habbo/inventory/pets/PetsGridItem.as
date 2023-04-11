package com.sulake.habbo.inventory.pets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import package_144.class_1572;
   
   public class PetsGridItem
   {
      
      private static const THUMB_COLOR_NORMAL:int = 13421772;
      
      private static const THUMB_COLOR_UNSEEN:int = 10275685;
       
      
      private var var_296:class_1572;
      
      private var _window:class_3151;
      
      private var _assets:class_21;
      
      private var var_2043:class_3127;
      
      private var var_3103:Boolean;
      
      private var var_3158:com.sulake.habbo.inventory.pets.PetsView;
      
      private var var_3430:int = -1;
      
      private var var_2722:Boolean;
      
      private var _isUnseen:Boolean;
      
      public function PetsGridItem(param1:com.sulake.habbo.inventory.pets.PetsView, param2:class_1572, param3:class_1684, param4:class_21, param5:Boolean)
      {
         super();
         if(param1 == null || param2 == null || param3 == null || param4 == null)
         {
            return;
         }
         _assets = param4;
         var_3158 = param1;
         var_296 = param2;
         _isUnseen = param5;
         var _loc8_:XmlAsset;
         if((_loc8_ = param4.getAssetByName("inventory_thumb_xml") as XmlAsset) == null || _loc8_.content == null)
         {
            return;
         }
         _window = param3.buildFromXML(_loc8_.content as XML) as class_3151;
         _window.procedure = eventHandler;
         var _loc7_:int = 64;
         var _loc11_:int = 3;
         var _loc9_:Boolean = false;
         var _loc6_:String = null;
         if(param2.typeId == 15)
         {
            _loc7_ = 32;
            _loc11_ = 2;
            _loc9_ = true;
         }
         else if(param2.typeId == 35)
         {
            _loc7_ = 64;
            _loc11_ = 3;
            _loc9_ = true;
         }
         else if(param2.typeId == 26 || param2.typeId == 27)
         {
            _loc7_ = 32;
            _loc11_ = 3;
            _loc9_ = true;
         }
         else if(param2.typeId == 16)
         {
            _loc7_ = 32;
            _loc11_ = 2;
            _loc9_ = true;
            if(param2.level >= 7)
            {
               _loc6_ = "std";
            }
            else
            {
               _loc6_ = "grw" + param2.level;
            }
         }
         var _loc10_:BitmapData = param1.getPetImage(param2,_loc11_,_loc9_,this,_loc7_,_loc6_);
         setPetImage(_loc10_);
         updateStatusGraphics();
      }
      
      public function dispose() : void
      {
         _assets = null;
         var_3158 = null;
         var_296 = null;
         var_2043 = null;
         var_3430 = -1;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function eventHandler(param1:class_3134, param2:class_3127) : void
      {
         switch(param1.type)
         {
            case "WME_DOWN":
               var_3158.setSelectedGridItem(this);
               var_2722 = true;
               break;
            case "WME_UP":
               var_2722 = false;
               break;
            case "WME_OUT":
               if(var_2722)
               {
                  var_2722 = false;
                  var_3158.placePetToRoom(var_296.id,true);
                  break;
               }
         }
      }
      
      public function setPetImage(param1:BitmapData) : void
      {
         if(!_window)
         {
            return;
         }
         var _loc3_:class_3282 = _window.findChildByName("bitmap") as class_3282;
         var _loc2_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height);
         _loc2_.fillRect(_loc2_.rect,0);
         _loc2_.copyPixels(param1,param1.rect,new Point(_loc2_.width / 2 - param1.width / 2,_loc2_.height / 2 - param1.height / 2));
         if(_loc3_.bitmap)
         {
            _loc3_.bitmap.dispose();
         }
         _loc3_.bitmap = _loc2_;
      }
      
      public function setUnseen(param1:Boolean) : void
      {
         if(_isUnseen != param1)
         {
            _isUnseen = param1;
            updateStatusGraphics();
         }
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(var_3103 != param1)
         {
            var_3103 = param1;
            if(!_window || !var_2043)
            {
               return;
            }
            updateStatusGraphics();
         }
      }
      
      private function updateStatusGraphics() : void
      {
         var _loc1_:class_3127 = _window.findChildByName("outline");
         if(_loc1_ != null)
         {
            _loc1_.visible = var_3103;
         }
         if(!var_2043)
         {
            var_2043 = _window.findChildByTag("BG_COLOR");
         }
         var_2043.color = _isUnseen ? 10275685 : 13421772;
      }
      
      public function get window() : class_3127
      {
         return _window;
      }
      
      public function get pet() : class_1572
      {
         return var_296;
      }
      
      public function set imageDownloadId(param1:int) : void
      {
         var_3430 = param1;
      }
      
      public function get imageDownloadId() : int
      {
         return var_3430;
      }
   }
}
