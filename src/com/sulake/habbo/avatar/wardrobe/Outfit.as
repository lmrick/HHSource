package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IOutfit;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import flash.display.BitmapData;
   
   public class Outfit implements IOutfit, class_1870
   {
       
      
      private var var_282:HabboAvatarEditor;
      
      private var var_427:String;
      
      private var var_122:String;
      
      private var var_1430:com.sulake.habbo.avatar.wardrobe.OutfitView;
      
      private var var_311:Boolean;
      
      public function Outfit(param1:HabboAvatarEditor, param2:String, param3:String)
      {
         super();
         var_282 = param1;
         var_1430 = new com.sulake.habbo.avatar.wardrobe.OutfitView(param1.manager.windowManager,param1.manager.assets,param2 != "");
         switch(param3)
         {
            case "M":
            case "m":
            case "M":
               param3 = "M";
               break;
            case "F":
            case "f":
            case "F":
               param3 = "F";
         }
         var_427 = param2;
         var_122 = param3;
         update();
      }
      
      public function dispose() : void
      {
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         var_427 = null;
         var_122 = null;
         var_311 = true;
         var_282 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function update() : void
      {
         var _loc1_:BitmapData = null;
         var _loc3_:Boolean = var_282.manager.getBoolean("zoom.enabled");
         var _loc2_:class_3156 = var_282.manager.avatarRenderManager.createAvatarImage(figure,_loc3_ ? "h" : "sh",var_122,this);
      
         if(_loc2_)
         {
            _loc2_.setDirection("full",4);
            _loc1_ = _loc2_.getImage("full",true,_loc3_ ? 0.5 : 1);
        
            if(var_1430 && _loc1_)
            {
               var_1430.update(_loc1_);
            }
            _loc2_.dispose();
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
      
      public function get view() : com.sulake.habbo.avatar.wardrobe.OutfitView
      {
         return var_1430;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         update();
      }
   }
}
