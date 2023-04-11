package package_74
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   [SecureSWF(rename="true")]
   public class class_1675
   {
       
      
      private var var_343:String;
      
      private var _localizationKey:String;
      
      public function class_1675(param1:IMessageDataWrapper)
      {
         super();
         var_343 = param1.readString();
         _localizationKey = param1.readString();
         if(_localizationKey == "")
         {
            _localizationKey = null;
         }
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get localizationKey() : String
      {
         return _localizationKey;
      }
   }
}
