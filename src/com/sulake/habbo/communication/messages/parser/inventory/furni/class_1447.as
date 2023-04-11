package package_166
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   import package_55.class_1598;
   
   [SecureSWF(rename="true")]
   public class class_1447 implements IMessageParser
   {
       
      
      protected var var_775:int;
      
      protected var var_960:int;
      
      private var var_173:class_24;
      
      public function class_1447()
      {
         super();
      }
      
      public function get totalFragments() : int
      {
         return var_775;
      }
      
      public function get fragmentNo() : int
      {
         return var_960;
      }
      
      public function get furniFragment() : class_24
      {
         return var_173;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:class_1598 = null;
         var_775 = param1.readInteger();
         var_960 = param1.readInteger();
         var_173 = new class_24();
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new class_1598(param1);
            var_173.add(_loc4_.itemId,_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_173)
         {
            var_173.dispose();
            var_173 = null;
         }
         return true;
      }
   }
}
