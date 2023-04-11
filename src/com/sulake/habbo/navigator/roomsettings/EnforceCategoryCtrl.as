package com.sulake.habbo.navigator.roomsettings
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.navigator.class_1686;
   import com.sulake.habbo.window.utils.IModalDialog;
   import package_11.class_1625;
   import package_31.class_963;
   
   public class EnforceCategoryCtrl
   {
       
      
      private var _navigator:class_1686;
      
      private var _window:class_3281;
      
      private var var_1680:IModalDialog;
      
      private var _categorySelection:int = 0;
      
      private var _tradeModeSelection:int = 0;
      
      private var var_2786:Array;
      
      public function EnforceCategoryCtrl(param1:class_1686)
      {
         var_2786 = [];
         super();
         _navigator = param1;
      }
      
      public function show(param1:int) : void
      {
         close();
         var_1680 = _navigator.windowManager.buildModalDialogFromXML(_navigator.assets.getAssetByName("enforce_category_xml").content as XML);
         _window = var_1680.rootWindow as class_3281;
         _window.procedure = windowProcedure;
         _window.center();
         _window.findChildByName("header_button_close").visible = false;
         var _loc2_:class_3287 = _window.findChildByName("trade_mode") as class_3287;
         var _loc5_:*;
         (_loc5_ = []).push("${navigator.roomsettings.trade_not_allowed}");
         _loc5_.push("${navigator.roomsettings.trade_not_with_Controller}");
         _loc5_.push("${navigator.roomsettings.trade_allowed}");
         _loc2_.populate(_loc5_);
         _loc2_.selection = 0;
         var _loc6_:class_3287 = _window.findChildByName("category") as class_3287;
         var_2786 = [];
         for each(var _loc7_ in _navigator.data.visibleCategories)
         {
            if(!_loc7_.automatic && (!_loc7_.staffOnly || _loc7_.staffOnly && _navigator.sessionData.hasSecurity(7)))
            {
               var_2786.push(_loc7_);
            }
         }
         var _loc3_:* = [];
         for each(var _loc4_ in var_2786)
         {
            _loc3_.push(_loc4_.visibleName);
         }
         _loc6_.populate(_loc3_);
         _loc6_.selection = 0;
      }
      
      private function close() : void
      {
         if(var_1680 && _window)
         {
            var_1680.dispose();
            var_1680 = null;
            _window = null;
         }
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
         if(param1.type == "WME_CLICK")
         {
            var _loc4_:* = param2.name;
            if("ok" === _loc4_)
            {
               _loc3_ = int(class_1625(var_2786[Math.max(0,_categorySelection)]).nodeId);
               _navigator.communication.connection.send(new class_963(_navigator.data.currentRoomId,_loc3_,_tradeModeSelection));
               close();
            }
         }
         else if(param1.type == "WE_SELECTED")
         {
            switch(param2.name)
            {
               case "category":
                  _categorySelection = class_3287(param2).selection;
                  break;
               case "trade_mode":
                  _tradeModeSelection = class_3287(param2).selection;
            }
         }
      }
   }
}
