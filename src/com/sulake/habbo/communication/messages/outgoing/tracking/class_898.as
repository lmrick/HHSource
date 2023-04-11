package package_49
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_898 implements IMessageComposer
   {
       
      
      private var var_774:String;
      
      private var var_271:String;
      
      private var _action:String;
      
      private var _extraString:String;
      
      private var var_728:int;
      
      public function class_898(param1:String, param2:String, param3:String, param4:String = "", param5:int = 0)
      {
         super();
         var_774 = !!param1 ? param1 : "";
         var_271 = !!param2 ? param2 : "";
         _action = !!param3 ? param3 : "";
         _extraString = !!param4 ? param4 : "";
         var_728 = !!param5 ? param5 : 0;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_774,var_271,_action,_extraString,var_728];
      }
   }
}
