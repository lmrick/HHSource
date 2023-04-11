package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1326 implements IMessageParser
   {
      
      private static const const_84:int = 16384;
      
      private static const const_56:int = 16383;
       
      
      private var var_45:Vector.<int>;
      
      private var _width:int = 0;
      
      private var var_47:int = 0;
      
      public function class_1326()
      {
         super();
      }
      
      public static function decodeTileHeight(param1:int) : Number
      {
         return param1 < 0 ? -1 : (param1 & 16383) / 256;
      }
      
      public static function decodeIsStackingBlocked(param1:int) : Boolean
      {
         return Boolean(param1 & 16384);
      }
      
      public static function decodeIsRoomTile(param1:int) : Boolean
      {
         return param1 >= 0;
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get height() : int
      {
         return var_47;
      }
      
      public function getTileHeight(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= _width || param2 < 0 || param2 >= var_47)
         {
            return -1;
         }
         return decodeTileHeight(var_45[param2 * _width + param1]);
      }
      
      public function getStackingBlocked(param1:int, param2:int) : Boolean
      {
         if(param1 < 0 || param1 >= _width || param2 < 0 || param2 >= var_47)
         {
            return true;
         }
         return decodeIsStackingBlocked(var_45[param2 * _width + param1]);
      }
      
      public function isRoomTile(param1:int, param2:int) : Boolean
      {
         if(param1 < 0 || param1 >= _width || param2 < 0 || param2 >= var_47)
         {
            return false;
         }
         return decodeIsRoomTile(var_45[param2 * _width + param1]);
      }
      
      public function flush() : Boolean
      {
         var_45 = null;
         _width = 0;
         var_47 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return false;
         }
         _width = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         var_47 = _loc3_ / _width;
         var_45 = new Vector.<int>(_loc3_);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_45[_loc2_] = param1.readShort();
            _loc2_++;
         }
         return true;
      }
   }
}
