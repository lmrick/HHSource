package package_137
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_1575 implements class_13
   {
       
      
      private var var_422:String;
      
      private var var_405:int;
      
      private var var_580:int;
      
      private var var_311:Boolean = false;
      
      public function class_1575(param1:IMessageDataWrapper)
      {
         super();
         var_422 = param1.readString();
         var_405 = param1.readInteger();
         var_580 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         var_311 = true;
         var_422 = "";
         var_405 = -1;
         var_580 = -1;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get pattern() : String
      {
         return var_422;
      }
      
      public function get startIndex() : int
      {
         return var_405;
      }
      
      public function get endIndex() : int
      {
         return var_580;
      }
   }
}
