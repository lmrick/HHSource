package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IGraphicContext;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   
   public class DisplayObjectWrapperController extends WindowController implements IDisplayObjectWrapper
   {
       
      
      public function DisplayObjectWrapperController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:class_3127, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 &= -17;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_1634 = false;
      }
      
      override public function getGraphicContext(param1:Boolean) : IGraphicContext
      {
         if(param1 && !var_1447)
         {
            var_1447 = new GraphicContext("GC {" + _name + "}",4,rectangle);
         }
         return var_1447;
      }
      
      public function getDisplayObject() : DisplayObject
      {
         return IGraphicContextHost(this).getGraphicContext(true).getDisplayObject();
      }
      
      public function setDisplayObject(param1:DisplayObject) : void
      {
         IGraphicContextHost(this).getGraphicContext(true).setDisplayObject(param1);
      }
   }
}
