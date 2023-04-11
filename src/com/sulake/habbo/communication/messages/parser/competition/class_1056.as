package package_129
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.Dictionary;
   
   [SecureSWF(rename="true")]
   public class class_1056 implements IMessageParser
   {
      
      public static const const_118:int = 0;
      
      public static const const_59:int = 1;
      
      public static const const_143:int = 2;
      
      public static const const_57:int = 3;
      
      public static const const_156:int = 4;
      
      public static const const_362:int = 5;
      
      public static const const_47:int = 6;
       
      
      private var var_429:int;
      
      private var var_822:String;
      
      private var var_170:int;
      
      private var var_258:Array;
      
      private var var_234:Dictionary;
      
      public function class_1056()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_258 = null;
         var_234 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var_429 = param1.readInteger();
         var_822 = param1.readString();
         var_170 = param1.readInteger();
         var_258 = [];
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_258.push(param1.readString());
            _loc2_++;
         }
         var_234 = new Dictionary();
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var_234[param1.readString()] = "";
            _loc2_++;
         }
         return true;
      }
      
      public function get goalId() : int
      {
         return var_429;
      }
      
      public function get goalCode() : String
      {
         return var_822;
      }
      
      public function get result() : int
      {
         return var_170;
      }
      
      public function get requiredFurnis() : Array
      {
         return var_258;
      }
      
      public function isMissing(param1:String) : Boolean
      {
         return false;
      }
   }
}
