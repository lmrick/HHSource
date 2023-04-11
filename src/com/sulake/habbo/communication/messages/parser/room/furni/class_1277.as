package package_136
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1277 implements IMessageParser
   {
       
      
      private var var_261:String;
      
      private var var_385:int;
      
      private var var_343:String;
      
      private var var_1101:int;
      
      private var var_1278:String;
      
      private var _placedInRoom:Boolean;
      
      private var _petFigureString:String;
      
      public function class_1277()
      {
         super();
      }
      
      public function get itemType() : String
      {
         return var_261;
      }
      
      public function get classId() : int
      {
         return var_385;
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get placedItemId() : int
      {
         return var_1101;
      }
      
      public function get placedItemType() : String
      {
         return var_1278;
      }
      
      public function get placedInRoom() : Boolean
      {
         return _placedInRoom;
      }
      
      public function get petFigureString() : String
      {
         return _petFigureString;
      }
      
      public function flush() : Boolean
      {
         var_261 = "";
         var_385 = 0;
         var_343 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_261 = param1.readString();
         var_385 = param1.readInteger();
         var_343 = param1.readString();
         var_1101 = param1.readInteger();
         var_1278 = param1.readString();
         _placedInRoom = param1.readBoolean();
         _petFigureString = param1.readString();
         return true;
      }
   }
}
