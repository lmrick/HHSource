package package_132
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_11.class_1549;
   import package_11.class_1557;
   import package_11.class_1583;
   
   [SecureSWF(rename="true")]
   public class class_1286 implements IMessageParser
   {
       
      
      private var var_45:class_1557;
      
      private var var_1162:class_1549;
      
      private var _promotedRooms:class_1583;
      
      public function class_1286()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_45 = new class_1557(param1);
         var _loc2_:int = param1.readInteger();
         if(_loc2_ > 0)
         {
            var_1162 = new class_1549(param1);
         }
         _promotedRooms = new class_1583(param1);
         return true;
      }
      
      public function get data() : class_1557
      {
         return var_45;
      }
      
      public function get adRoom() : class_1549
      {
         return var_1162;
      }
      
      public function get promotedRooms() : class_1583
      {
         return _promotedRooms;
      }
   }
}
