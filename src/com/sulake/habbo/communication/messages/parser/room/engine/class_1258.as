package package_154
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1258 implements IMessageParser
   {
       
      
      private var var_45:IMessageDataWrapper;
      
      private var var_158:int;
      
      private var var_29:int;
      
      private var var_28:int;
      
      private var var_195:int;
      
      public function class_1258()
      {
         super();
      }
      
      public function next() : Boolean
      {
         if(var_158 == 0)
         {
            return false;
         }
         var_158--;
         var_29 = var_45.readByte();
         var_28 = var_45.readByte();
         var_195 = var_45.readShort();
         return true;
      }
      
      public function get x() : int
      {
         return var_29;
      }
      
      public function get y() : int
      {
         return var_28;
      }
      
      public function get tileHeight() : Number
      {
         return class_1326.decodeTileHeight(var_195);
      }
      
      public function get isStackingBlocked() : Boolean
      {
         return class_1326.decodeIsStackingBlocked(var_195);
      }
      
      public function get isRoomTile() : Boolean
      {
         return class_1326.decodeIsRoomTile(var_195);
      }
      
      public function flush() : Boolean
      {
         var_158 = 0;
         var_45 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_45 = param1;
         var_158 = param1.readByte();
         return true;
      }
   }
}
