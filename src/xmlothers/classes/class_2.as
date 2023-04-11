package
{
   import flash.display.Sprite;
   import flash.net.LocalConnection;
   import flash.utils.ByteArray;
   
   public class class_2
   {
       
      
      private var var_4:Class;
      
      private var var_3:Class;
      
      public function class_2()
      {
         this.var_4 = class_5;
         this.var_3 = class_4;
         super();
      }
      
      public function method_4(param1:Sprite) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc12_:String = null;
         var _loc2_:* = [];
         var _loc3_:* = "";
         var _loc6_:String = param1.loaderInfo.loaderURL;
         var _loc7_:String = new LocalConnection().domain;
         var _loc8_:Array = this.method_5().split("|");
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_.length)
         {
            if((_loc12_ = (_loc8_[_loc9_] as String).toLocaleLowerCase()) == "?")
            {
               _loc5_ = true;
            }
            else if(_loc12_.indexOf("localhost") != -1)
            {
               _loc4_ = true;
            }
            else if(_loc12_.indexOf("http:") == 0 || _loc12_.indexOf("https:") == 0)
            {
               _loc2_.push(_loc12_);
            }
            else
            {
               if(_loc3_ != "")
               {
                  _loc3_ += "|";
               }
               if(_loc12_.indexOf("*.") == 0)
               {
                  _loc12_ = _loc12_.replace("*.","((\\w|-|_)+\\.)*");
               }
               _loc3_ += _loc12_;
            }
            _loc9_++;
         }
         var _loc10_:RegExp = new RegExp("^http(|s)://((www)+\\.)*(" + _loc3_ + ")","i");
         if(_loc7_.toLowerCase() == "localhost")
         {
            if(_loc4_)
            {
               return true;
            }
            if(_loc5_)
            {
               param1.width = 0;
               param1.height = 0;
               return false;
            }
         }
         if(_loc10_.test(_loc6_))
         {
            return true;
         }
         var _loc11_:int = 0;
         while(_loc11_ < _loc2_.length)
         {
            if(_loc6_.indexOf(_loc2_[_loc11_]) == 0)
            {
               return true;
            }
            _loc11_++;
         }
         if(_loc3_.length == 0 && _loc2_.length == 0 && _loc5_)
         {
            return true;
         }
         param1.width = 0;
         param1.height = 0;
         return false;
      }
      
      private function method_5() : String
      {
         var _loc1_:ByteArray = new this.var_4() as ByteArray;
         var _loc2_:class_3 = new class_3(new this.var_3() as ByteArray);
         _loc2_.method_5(_loc1_);
         _loc1_.position = 0;
         return _loc1_.readUTFBytes(_loc1_.length);
      }
   }
}
