package package_148
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1270 implements IMessageParser
   {
       
      
      private var var_222:Vector.<package_148.class_1545>;
      
      private var var_211:Vector.<String>;
      
      public function class_1270()
      {
         var_222 = new Vector.<package_148.class_1545>(0);
         var_211 = new Vector.<String>(0);
         super();
      }
      
      public function flush() : Boolean
      {
         var_222 = new Vector.<package_148.class_1545>(0);
         var_211 = new Vector.<String>(0);
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_222.push(new package_148.class_1545(param1));
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_211.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get recipeProductItems() : Vector.<package_148.class_1545>
      {
         return var_222;
      }
      
      public function get usableInventoryFurniClasses() : Vector.<String>
      {
         return var_211;
      }
      
      public function hasData() : Boolean
      {
         return false;
      }
   }
}
