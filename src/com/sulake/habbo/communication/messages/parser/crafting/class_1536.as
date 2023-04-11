package package_148
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1536
   {
       
      
      private var var_158:int;
      
      private var var_552:String;
      
      public function class_1536(param1:IMessageDataWrapper)
      {
         super();
         var_158 = param1.readInteger();
         var_552 = param1.readString();
      }
      
      public function get count() : int
      {
         return var_158;
      }
      
      public function get furnitureClassName() : String
      {
         return var_552;
      }
   }
}
