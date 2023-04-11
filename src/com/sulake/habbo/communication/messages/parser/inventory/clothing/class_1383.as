package package_179
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1383 implements IMessageParser
   {
       
      
      private var var_608:Vector.<int>;
      
      private var var_627:Vector.<String>;
      
      public function class_1383()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_608 = new Vector.<int>(0);
         var_627 = new Vector.<String>(0);
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_608.push(param1.readInteger());
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_627.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get figureSetIds() : Vector.<int>
      {
         return var_608;
      }
      
      public function get boundFurnitureNames() : Vector.<String>
      {
         return var_627;
      }
   }
}
