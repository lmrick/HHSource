package package_1
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class class_466 implements IMessageComposer
   {
       
      
      private var var_995:int;
      
      private var var_906:String;
      
      private var var_1114:String;
      
      public function class_466(param1:int, param2:String, param3:String)
      {
         super();
         var_995 = param1;
         var_906 = param2;
         var_1114 = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_995,var_906,var_1114];
      }
   }
}
