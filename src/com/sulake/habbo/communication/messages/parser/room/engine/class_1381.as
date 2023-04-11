package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1381 implements IMessageParser
   {
       
      
      private var _text:String = "";
      
      private var var_132:Array;
      
      private var _width:int = 0;
      
      private var var_47:int = 0;
      
      private var var_757:Number = 0;
      
      private var _fixedWallsHeight:int = -1;
      
      public function class_1381()
      {
         var_132 = [];
         super();
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get height() : int
      {
         return var_47;
      }
      
      public function get fixedWallsHeight() : int
      {
         return _fixedWallsHeight;
      }
      
      public function get scale() : Number
      {
         return var_757;
      }
      
      public function getTileHeight(param1:int, param2:int) : int
      {
         if(param1 < 0 || param1 >= width || param2 < 0 || param2 >= height)
         {
            return -110;
         }
         var _loc3_:Array = var_132[param2] as Array;
         return _loc3_[param1];
      }
      
      public function flush() : Boolean
      {
         var_132 = [];
         _width = 0;
         var_47 = 0;
         _text = "";
         _fixedWallsHeight = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:String = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc5_:Boolean = param1.readBoolean();
         _fixedWallsHeight = param1.readInteger();
         _text = param1.readString();
         var _loc9_:Array = _text.split("\r");
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:* = null;
         var _loc11_:int = int(_loc9_.length);
         var _loc3_:int = 0;
         var _loc8_:String = null;
         _loc7_ = 0;
         while(_loc7_ < _loc11_)
         {
            if((_loc8_ = _loc9_[_loc7_] as String).length > _loc3_)
            {
               _loc3_ = _loc8_.length;
            }
            _loc7_++;
         }
         var_132 = [];
         _loc7_ = 0;
         while(_loc7_ < _loc11_)
         {
            _loc2_ = [];
            _loc6_ = 0;
            while(_loc6_ < _loc3_)
            {
               _loc2_.push(-110);
               _loc6_++;
            }
            var_132.push(_loc2_);
            _loc7_++;
         }
         _width = _loc3_;
         var_47 = _loc11_;
         _loc7_ = 0;
         while(_loc7_ < _loc9_.length)
         {
            _loc2_ = var_132[_loc7_] as Array;
            if((_loc8_ = _loc9_[_loc7_] as String).length > 0)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc8_.length)
               {
                  if((_loc4_ = _loc8_.charAt(_loc6_)) != "x" && _loc4_ != "X")
                  {
                     _loc10_ = parseInt(_loc4_,36);
                  }
                  else
                  {
                     _loc10_ = -110;
                  }
                  _loc2_[_loc6_] = _loc10_;
                  _loc6_++;
               }
            }
            _loc7_++;
         }
         var_757 = _loc5_ ? 32 : 64;
         return true;
      }
      
      public function get text() : String
      {
         return _text;
      }
   }
}
