package com.sulake.habbo.room.object
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomPlaneBitmapMaskData
   {
      
      public static const MASK_CATEGORY_WINDOW:String = "window";
      
      public static const MASK_CATEGORY_HOLE:String = "hole";
       
      
      private var var_537:Vector3d = null;
      
      private var var_271:String = null;
      
      private var var_774:String = null;
      
      public function RoomPlaneBitmapMaskData(param1:String, param2:IVector3d, param3:String)
      {
         super();
         this.type = param1;
         this.loc = param2;
         this.category = param3;
      }
      
      public function get loc() : IVector3d
      {
         return var_537;
      }
      
      public function set loc(param1:IVector3d) : void
      {
         if(var_537 == null)
         {
            var_537 = new Vector3d();
         }
         var_537.assign(param1);
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function set type(param1:String) : void
      {
         var_271 = param1;
      }
      
      public function get category() : String
      {
         return var_774;
      }
      
      public function set category(param1:String) : void
      {
         var_774 = param1;
      }
      
      public function dispose() : void
      {
         var_537 = null;
      }
   }
}
