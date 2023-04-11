package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import package_17.class_1600;
   
   [SecureSWF(rename="true")]
   public class class_1638
   {
       
      
      public function class_1638()
      {
         super();
      }
      
      public static function parseItemData(param1:IMessageDataWrapper) : class_1600
      {
         var _loc17_:String = null;
         var _loc23_:String = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc21_:int = 0;
         var _loc15_:int = 0;
         var _loc19_:String = null;
         var _loc10_:Array = null;
         var _loc16_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc11_:int = int(param1.readString());
         var _loc7_:int = param1.readInteger();
         var _loc2_:String = param1.readString();
         var _loc5_:String = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = param1.readInteger();
         var _loc9_:int = param1.readInteger();
         var _loc20_:int = 0;
         var _loc12_:Number = parseFloat(_loc5_);
         if(!isNaN(_loc12_))
         {
            _loc20_ = int(_loc5_);
         }
         class_14.log("\n\n PARSING WALL ITEM: ");
         class_14.log("wallItemId: " + _loc11_);
         class_14.log("wallItemTypeId: " + _loc7_);
         class_14.log("location: " + _loc2_);
         class_14.log("dataStr: " + _loc5_);
         class_14.log("secondsToExpiration: " + _loc3_);
         class_14.log("state: " + _loc20_);
         var _loc6_:class_1600 = null;
         var _loc22_:Array = null;
         var _loc24_:String = null;
         if(_loc2_.indexOf(":") == 0)
         {
            _loc6_ = new class_1600(_loc11_,_loc7_,false);
            if((_loc22_ = _loc2_.split(" ")).length >= 3)
            {
               _loc17_ = String(_loc22_[0]);
               _loc23_ = String(_loc22_[1]);
               _loc24_ = String(_loc22_[2]);
               if(_loc17_.length > 3 && _loc23_.length > 2)
               {
                  _loc17_ = _loc17_.substr(3);
                  _loc23_ = _loc23_.substr(2);
                  if((_loc22_ = _loc17_.split(",")).length >= 2)
                  {
                     _loc13_ = int(_loc22_[0]);
                     _loc14_ = int(_loc22_[1]);
                     if((_loc22_ = _loc23_.split(",")).length >= 2)
                     {
                        _loc21_ = int(_loc22_[0]);
                        _loc15_ = int(_loc22_[1]);
                        _loc6_.wallX = _loc13_;
                        _loc6_.wallY = _loc14_;
                        _loc6_.localX = _loc21_;
                        _loc6_.localY = _loc15_;
                        _loc6_.dir = _loc24_;
                        _loc6_.data = _loc5_;
                        _loc6_.state = _loc20_;
                     }
                  }
               }
            }
         }
         else
         {
            _loc6_ = new class_1600(_loc11_,_loc7_,true);
            if((_loc22_ = _loc2_.split(" ")).length >= 2)
            {
               if((_loc24_ = String(_loc22_[0])) == "rightwall" || _loc24_ == "frontwall")
               {
                  _loc24_ = "r";
               }
               else
               {
                  _loc24_ = "l";
               }
               if((_loc10_ = (_loc19_ = String(_loc22_[1])).split(",")).length >= 3)
               {
                  _loc16_ = 0;
                  _loc18_ = parseFloat(_loc10_[0]);
                  _loc8_ = parseFloat(_loc10_[1]);
                  _loc6_.y = _loc18_;
                  _loc6_.z = _loc8_;
                  _loc6_.dir = _loc24_;
                  _loc6_.data = _loc5_;
                  _loc6_.state = _loc20_;
               }
            }
         }
         _loc6_.usagePolicy = _loc4_;
         _loc6_.ownerId = _loc9_;
         _loc6_.secondsToExpiration = _loc3_;
         return _loc6_;
      }
   }
}
