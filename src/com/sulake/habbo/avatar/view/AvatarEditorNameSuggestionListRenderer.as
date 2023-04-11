package com.sulake.habbo.avatar.view
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.avatar.HabboAvatarEditorManager;
   import flash.geom.Rectangle;
   
   public class AvatarEditorNameSuggestionListRenderer
   {
       
      
      private const MARGIN_X:int = 5;
      
      private const MARGIN_Y:int = 5;
      
      private var var_437:HabboAvatarEditorManager;
      
      private var _offsetX:int;
      
      private var _offsetY:int;
      
      private var var_4266:int = 0;
      
      private var var_2895:Rectangle = null;
      
      public function AvatarEditorNameSuggestionListRenderer(param1:HabboAvatarEditorManager)
      {
         super();
         this.var_437 = param1;
      }
      
      public function dispose() : void
      {
         var_437 = null;
      }
      
      public function render(param1:Array, param2:class_3151) : int
      {
         var _loc7_:class_3127 = null;
         var _loc4_:ITextWindow = null;
         var _loc5_:int = 0;
         while(param2.numChildren > 0)
         {
            (_loc7_ = param2.removeChildAt(0)).dispose();
         }
         param2.parent.invalidate();
         var_4266 = 0;
         _offsetX = 0;
         _offsetY = 0;
         var_2895 = param2.rectangle;
         var_2895.height = 150;
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = createItem(param1[_loc5_] as String);
            if(fit(_loc4_))
            {
               param2.addChild(_loc4_);
            }
            else
            {
               _loc4_.dispose();
            }
            _loc5_++;
         }
         var _loc6_:int;
         if((_loc6_ = param2.numChildren) == 0)
         {
            return 0;
         }
         var _loc3_:class_3127 = param2.getChildAt(param2.numChildren - 1);
         return _loc3_.bottom;
      }
      
      private function fit(param1:class_3127) : Boolean
      {
         if(param1.width > var_2895.width || param1.width < 2)
         {
            return false;
         }
         if(_offsetY + param1.height > var_2895.height)
         {
            return false;
         }
         if(_offsetX + param1.width > var_2895.width)
         {
            _offsetX = 0;
            _offsetY += param1.height + 5;
            return fit(param1);
         }
         param1.x += _offsetX;
         param1.y += _offsetY;
         _offsetX += param1.width + 5;
         return true;
      }
      
      private function createItem(param1:String) : ITextWindow
      {
         var _loc2_:ITextWindow = var_437.windowManager.buildFromXML(XML(HabboAvatarEditorCom.avatar_editor_name_change_item)) as ITextWindow;
         if(_loc2_ == null)
         {
            return null;
         }
         _loc2_.text = param1;
         return _loc2_;
      }
   }
}
