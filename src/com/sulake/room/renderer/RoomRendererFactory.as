package com.sulake.room.renderer
{
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;

   public class RoomRendererFactory extends class_20 implements IRoomRendererFactory
   {
       
      
      public function RoomRendererFactory(param1:class_31, param2:uint = 0)
      {
         super(param1,param2);
      }
      
      public function createRenderer() : IRoomRenderer
      {
         return new class_3222(this);
      }
   }
}
