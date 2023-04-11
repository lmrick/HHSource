package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.avatar.class_3157;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   
   public class AvatarVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var _avatarRenderer:class_1690 = null;
      
      public function AvatarVisualizationData()
      {
         super();
      }
      
      public function get avatarRenderer() : class_1690
      {
         return _avatarRenderer;
      }
      
      public function set avatarRenderer(param1:class_1690) : void
      {
         _avatarRenderer = param1;
      }
      
      public function initialize(param1:XML) : Boolean
      {
         return true;
      }
      
      public function dispose() : void
      {
         _avatarRenderer = null;
      }
      
      public function getAvatar(param1:String, param2:Number, param3:String = null, param4:class_1870 = null, param5:class_3157 = null) : class_3156
      {
         var _loc6_:class_3156 = null;
         if(_avatarRenderer != null)
         {
            _loc6_ = null;
            if(param2 > 48)
            {
               _loc6_ = _avatarRenderer.createAvatarImage(param1,"h",param3,param4,param5);
            }
            else
            {
               _loc6_ = _avatarRenderer.createAvatarImage(param1,"h_50",param3,param4,param5);
            }
            return _loc6_;
         }
         return null;
      }
      
      public function getLayerCount(param1:String) : Number
      {
         return 0;
      }
      
      public function getAvatarRendererAsset(param1:String) : IAsset
      {
         if(_avatarRenderer == null)
         {
            return null;
         }
         return _avatarRenderer.assets.getAssetByName(param1);
      }
   }
}
