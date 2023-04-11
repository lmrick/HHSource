package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IGraphicContext;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   
   public class DesktopController extends ActivatorController implements class_3234, class_3207
   {
       
      
      public function DesktopController(param1:String, param2:WindowContext, param3:Rectangle)
      {
         super(param1,0,0,0,param2,param3,null,defaultProcedure,null,null,0);
      }
      
      public function get mouseX() : int
      {
         return getDisplayObject().stage.mouseX;
      }
      
      public function get mouseY() : int
      {
         return getDisplayObject().stage.mouseY;
      }
      
      override public function set parent(param1:class_3127) : void
      {
         throw new Error("Desktop window doesn\'t have parent!");
      }
      
      override public function set procedure(param1:Function) : void
      {
         var_2090 = param1 != null ? param1 : defaultProcedure;
      }
      
      override public function get host() : class_3127
      {
         return this;
      }
      
      override public function get desktop() : class_3234
      {
         return this;
      }
      
      override public function getGraphicContext(param1:Boolean) : IGraphicContext
      {
         if(param1 && !var_1447)
         {
            var_1447 = new GraphicContext("GC {" + _name + "}",256,rectangle);
            GraphicContext(var_1447).mouseEnabled = true;
            GraphicContext(var_1447).doubleClickEnabled = true;
         }
         return var_1447;
      }
      
      public function getActiveWindow() : class_3127
      {
         return getActiveChild();
      }
      
      public function setActiveWindow(param1:class_3127) : class_3127
      {
         return setActiveChild(param1);
      }
      
      public function getDisplayObject() : DisplayObject
      {
         return getGraphicContext(true) as DisplayObject;
      }
      
      public function setDisplayObject(param1:DisplayObject) : void
      {
         getGraphicContext(true).setDisplayObject(param1);
      }
      
      override public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      private function defaultProcedure(param1:class_3134, param2:class_3127) : void
      {
      }
   }
}
