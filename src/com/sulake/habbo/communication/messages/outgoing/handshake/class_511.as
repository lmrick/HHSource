package package_1
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class class_511 implements IMessageComposer
   {
       
      
      private var var_231:String;
      
      private var var_869:String;
      
      private var _flashVersion:String;
      
      public function class_511(param1:String, param2:String, param3:String)
      {
         super();
         var_231 = param1;
         var_869 = param2;
         _flashVersion = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_231,var_869,_flashVersion];
      }
   }
}
