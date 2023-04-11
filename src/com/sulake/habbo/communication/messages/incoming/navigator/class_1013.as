package package_11
{
   import com.sulake.core.communication.messages.MessageEvent;
   import package_132.class_1107;
   
   [SecureSWF(rename="true")]
   public class class_1013 extends MessageEvent
   {
       
      
      public function class_1013(param1:Function)
      {
         super(param1,class_1107);
      }
      
      public function get globalId() : String
      {
         return (this.var_15 as class_1107).globalId;
      }
      
      public function get convertedId() : int
      {
         return (this.var_15 as class_1107).convertedId;
      }
      
      public function getParser() : class_1107
      {
         return var_15 as class_1107;
      }
   }
}
