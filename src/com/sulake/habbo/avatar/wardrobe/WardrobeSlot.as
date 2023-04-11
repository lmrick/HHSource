package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3258;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IOutfit;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class WardrobeSlot implements IOutfit, class_1870
   {
       
      
      private var var_282:HabboAvatarEditor;
      
      private var var_427:String;
      
      private var var_122:String;
      
      private var var_787:Boolean;
      
      private var var_1430:class_3151;
      
      private var var_1861:class_3282;
      
      private var var_789:int;
      
      private var var_311:Boolean;
      
      public function WardrobeSlot(param1:class_3127, param2:HabboAvatarEditor, param3:int, param4:Boolean, param5:String = null, param6:String = null)
      {
         super();
         var_282 = param2;
         var_789 = param3;
         createView(param1);
         update(param5,param6,param4);
      }
      
      public function get id() : int
      {
         return var_789;
      }
      
      public function update(param1:String, param2:String, param3:Boolean) : void
      {
         switch(param2)
         {
            case "M":
            case "m":
            case "M":
               param2 = "M";
               break;
            case "F":
            case "f":
            case "F":
               param2 = "F";
         }
         var_427 = param1;
         var_122 = param2;
         var_787 = param3;
         updateView();
      }
      
      private function createView(param1:class_3127) : void
      {
         var_1430 = param1.clone() as class_3151;
         var_1430.procedure = eventHandler;
         var_1430.visible = false;
         var_1861 = var_1430.findChildByName("image") as class_3282;
      }
      
      public function dispose() : void
      {
         var_282 = null;
         var_427 = null;
         var_122 = null;
         var_1861 = null;
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function updateView() : void
      {
         var _loc1_:BitmapData = null;
         var _loc5_:class_3156 = null;
         var _loc9_:BitmapDataAsset = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc8_:Boolean = true;
         var _loc6_:Boolean = var_282.manager.getBoolean("zoom.enabled");
         if(var_427 && var_787)
         {
            if(_loc5_ = var_282.manager.avatarRenderManager.createAvatarImage(figure,_loc6_ ? "h" : "sh",var_122,this))
            {
               _loc5_.setDirection("full",4);
               _loc1_ = _loc5_.getCroppedImage("full",_loc6_ ? 0.5 : 1);
               _loc5_.dispose();
            }
         }
         else if(_loc9_ = var_282.manager.windowManager.assets.getAssetByName("avatar_editor_wardrobe_empty_slot") as BitmapDataAsset)
         {
            _loc1_ = _loc9_.content as BitmapData;
            _loc8_ = false;
         }
         if(!_loc1_)
         {
            return;
         }
         if(var_1861)
         {
            if(false)
            {
               var_1861.bitmap.dispose();
            }
            var_1861.bitmap = new BitmapData(var_1861.width,var_1861.height,true,0);
            _loc3_ = (0 - _loc1_.width) / 2;
            _loc4_ = (0 - _loc1_.height) / 2;
            var_1861.bitmap.draw(_loc1_,new Matrix(1,0,0,1,_loc3_,_loc4_));
         }
         if(_loc8_)
         {
            _loc1_.dispose();
         }
         var _loc7_:class_3258;
         if(_loc7_ = var_1430.findChildByName("set_button") as class_3258)
         {
            _loc7_.visible = var_787;
         }
         var _loc2_:class_3258 = var_1430.findChildByName("get_button") as class_3258;
         if(_loc2_)
         {
            _loc2_.visible = var_787 && var_427 != null;
         }
      }
      
      private function eventHandler(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(!var_282.verifyClubLevel())
         {
            return;
         }
         switch(param2.name)
         {
            case "set_button":
               var_427 = var_282.figureData.getFigureString();
               var_122 = var_282.gender;
               var_282.handler.saveWardrobeOutfit(var_789,this);
               updateView();
               break;
            case "get_button":
            case "get_figure":
               if(var_427)
               {
                  var_282.setNftOutfit(null);
                  var_282.loadAvatarInEditor(var_427,var_122,var_282.clubMemberLevel);
                  break;
               }
         }
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get view() : class_3151
      {
         return var_1430;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         updateView();
      }
   }
}
