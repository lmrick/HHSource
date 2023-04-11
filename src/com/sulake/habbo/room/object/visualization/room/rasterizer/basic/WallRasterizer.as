package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.class_1667;
   import flash.display.BitmapData;
   
   public class WallRasterizer extends PlaneRasterizer
   {
       
      
      public function WallRasterizer()
      {
         super();
      }
      
      override protected function initializePlanes() : void
      {
         if(data == null)
         {
            return;
         }
         var _loc1_:XMLList = data.walls;
         if(_loc1_.length() > 0)
         {
            parseWalls(_loc1_[0]);
         }
      }
      
      protected function parseWalls(param1:XML) : void
      {
         var _loc5_:int = 0;
         var _loc2_:XML = null;
         var _loc6_:String = null;
         var _loc4_:XMLList = null;
         var _loc7_:WallPlane = null;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:XMLList = param1.wall;
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length())
         {
            _loc2_ = _loc3_[_loc5_];
            if(class_1667.checkRequiredAttributes(_loc2_,["id"]))
            {
               _loc6_ = _loc2_.@id;
               _loc4_ = _loc2_.visualization;
               _loc7_ = new WallPlane();
               parseVisualizations(_loc7_,_loc4_);
               if(!addPlane(_loc6_,_loc7_))
               {
                  _loc7_.dispose();
               }
            }
            _loc5_++;
         }
      }
      
      override public function render(param1:BitmapData, param2:String, param3:Number, param4:Number, param5:Number, param6:IVector3d, param7:Boolean, param8:Number = 0, param9:Number = 0, param10:Number = 0, param11:Number = 0, param12:int = 0) : PlaneBitmapData
      {
         var _loc15_:WallPlane;
         if((_loc15_ = getPlane(param2) as WallPlane) == null)
         {
            _loc15_ = getPlane("default") as WallPlane;
         }
         if(_loc15_ == null)
         {
            return null;
         }
         if(param1 != null)
         {
            param1.fillRect(param1.rect,16777215);
         }
         var _loc14_:BitmapData;
         if((_loc14_ = _loc15_.render(param1,param3,param4,param5,param6,param7)) != null && _loc14_ != param1)
         {
            try
            {
               _loc14_ = _loc14_.clone();
            }
            catch(e:Error)
            {
               if(_loc14_)
               {
                  _loc14_.dispose();
               }
               return null;
            }
         }
         return new PlaneBitmapData(_loc14_,-1);
      }
      
      override public function getTextureIdentifier(param1:Number, param2:IVector3d) : String
      {
         if(param2 != null)
         {
            return param1 + "_" + param2.x + "_" + param2.y + "_" + param2.z;
         }
         return super.getTextureIdentifier(param1,param2);
      }
   }
}
