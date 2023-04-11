package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.avatar.class_3157;
   import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualizationData;
   
   public class AvatarFurnitureVisualizationData extends FurnitureVisualizationData
   {
       
      
      private var var_2871:AvatarVisualizationData;
      
      public function AvatarFurnitureVisualizationData()
      {
         super();
         var_2871 = new AvatarVisualizationData();
      }
      
      public function set avatarRenderer(param1:class_1690) : void
      {
         var_2871.avatarRenderer = param1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_2871.dispose();
         var_2871 = null;
      }
      
      public function getAvatar(param1:String, param2:Number, param3:String = null, param4:class_1870 = null, param5:class_3157 = null) : class_3156
      {
         return var_2871.getAvatar(param1,param2,param3,param4,param5);
      }
   }
}
